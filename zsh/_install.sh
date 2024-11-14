#!/bin/sh

case "$(uname -a)" in
    *Darwin*) brew install zsh ;;
    *Debian*) apt install zsh ;;
esac
