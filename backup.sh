#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

save() {
  name=$1
  mkdir -p $(dirname $name) && cp -R ~/$name ./$name
}

save ".config/fish/config.fish"
save ".vimrc"
save ".hammerspoon/init.lua"
save ".spacemacs"
save ".atom/init.coffee"
