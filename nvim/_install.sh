#!/bin/sh

case "$(uname -a)" in
    *Darwin*) brew install neovim gcc make ;;
    *Debian*) apt install neovim gcc make ;;
esac
