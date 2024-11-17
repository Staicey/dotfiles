#!/usr/bin/env bash
source _helpers.sh
installPackage bat

which -s batcat || ln -s /usr/local/bin/bat /usr/local/bin/batcat
