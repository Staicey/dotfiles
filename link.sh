#!/bin/bash

cd "$(dirname "$0")" || exit 1

while getopts "f" o; do
    case "$o" in
        "f") FORCE_REINSTALL=1 ;;
        *) ;;
    esac
done
shift $((OPTIND - 1))

source scripts/helpers.sh

MODULES="$(grep -v '#' "enabled")"
COMBINED_RC=""

# New PCs might not have this
sudo mkdir -p /usr/local/bin

for module in $MODULES; do
    DEPS="${module}/_dependencies"
    RC="${module}/_rc"

    if [ -f "$DEPS" ]; then
        while read -r dependency; do
            which "$dependency" 1>/dev/null || fail "Missing dependency : ${dependency}"
        done <"$DEPS"
    fi

    if [ -f "$RC" ]; then
        COMBINED_RC="${COMBINED_RC}\n\n$(cat "$RC")"
    fi

    if ! which -s "$module" || [ -n "$FORCE_REINSTALL" ]; then
        echo "Installing: ${module}"

        if [ -f "${module}/_install.sh" ]; then
            eval "${module}/_install.sh"
        else
            installPackage "${module}"
        fi
    fi

    case "$module" in
        "zsh")
            RC_NAME=".zshrc"
            cp "${module}/.zshrc" "${HOME}/.zshrc"

            if uname -a | grep -qv Darwin; then
                grep "$USER" /etc/passwd | grep -q "/bin/zsh" || sudo chsh -s /bin/zsh "$USER"
            fi
            ;;
        *)
            [ ! -d "${module}" ] && {
                echo "Warning: ${module} is enabled but not found"
                continue
            }
            MOD_CONFIG="$(find "$module" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)"
            while read -r config; do
                [ -z "$config" ] && continue
                CONFIG_LOC="${HOME}/${config//_//}"
                TARGET="${PWD}/${module}/${config}"

                [ -e "${CONFIG_LOC}" ] && rm -rd "${CONFIG_LOC}"
                ln -s "${TARGET}" "${CONFIG_LOC}"
            done <<<"$MOD_CONFIG"
            ;;
    esac
done

RC_FILE="${HOME}/${RC_NAME}"
[ -f "$RC_FILE" ] && rm "$RC_FILE"

# Ensure all new lines are rendered
COMBINED_RC="$(echo -e "$COMBINED_RC")"

grep "^alias " <<<"$COMBINED_RC" >>"${RC_FILE}"
grep -v "^alias " <<<"$COMBINED_RC" >>"${RC_FILE}"
