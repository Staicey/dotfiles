#!/bin/bash

source scripts/helpers.sh
installPackage gcc make golang python3

case "$(uname -a)" in
    *Darwin*) installPackage neovim virtualenv ;;
    *Debian*)
        installPackage libfuse2 python3-venv

        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
        chmod u+x nvim.appimage
        sudo mv nvim.appimage "/usr/local/bin/nvim"
        ;;
esac
