#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

args=("$@")

where=${args[0]}

dest="$where/nursery"
mkdir -p "$dest"

save() {
  name=$1
  mkdir -p $(dirname $dest/$name) && cp -R ~/$name $dest/$name
}

save ".config/fish/config.fish"
save ".vimrc"
save ".hammerspoon/init.lua"
save ".spacemacs"
save ".atom/init.coffee"

DDDD=$(date +%Y_%m_%d)
git commit -am "Auto Update $DDDD"
git push -u origin master
