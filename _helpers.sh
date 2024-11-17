#!/usr/bin/env bash

function fail {
    echo "Error: ${*}"
    exit 1
}

function installPackage {
    [[ "$1" =~ ^_func_* ]] && isFunc=1

    case "$(uname -a)" in
        *Darwin*)
            if [ -z "$isFunc" ]; then
                which -s brew || fail "Brew not installed"
                brew install "${@}"
            else
                "$@" || fail "Installation of package failed!"
            fi
            ;;
        *Debian*)
            if [ -z "$isFunc" ]; then
                which -s apt || fail "Apt not installed"
                apt install "${@}"
            else
                "$@" || fail "Installation of package failed!"
            fi
            ;;
    esac
}
