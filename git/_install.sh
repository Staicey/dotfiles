#!/bin/sh

case "$(uname -a)" in
    *Darwin*) brew install git ;;
    *Debian*) apt install git ;;
esac
