#!/usr/bin/env zsh

# create and cd into directory
function mkd() {
  mkdir -p $@ && cd ${@:$#}
}