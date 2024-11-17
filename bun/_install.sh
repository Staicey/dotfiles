#!/usr/bin/env bash
curl -fsSL https://bun.sh/install | bash

which -s node || ln -s "${HOME}/.bun/bin/bun" "/usr/local/bin/node"
which -s npm || ln -s "${HOME}/.bun/bin/bun" "/usr/local/bin/npm"

if [ -f "${HOME}/.zshrc" ]; then
    CLEAN_RC="$(grep -ve '# bun' -e 'BUN_INSTALL' -e '.bun/_bun' "${HOME}/.zshrc")"
    echo "$CLEAN_RC" >"${HOME}/.zshrc"
fi
