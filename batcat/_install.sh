#!/bin/sh

case "$(uname -a)" in
    *Darwin*)
        brew install bat
        ln -s /usr/local/bin/bat /usr/local/bin/batcat
        ;;
    *Debian*) apt install bat ;;
esac
