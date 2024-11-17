#!/usr/bin/env bash
source scripts/helpers.sh
installPackage bat

which -s batcat || ln -s /usr/local/bin/bat /usr/local/bin/batcat
