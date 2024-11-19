#!/usr/bin/env zsh

function mkd() {
  mkdir -p $@ && cd ${@:$#}
}

function clone() {
  git clone $@
  if [ "$2" ]; then
    cd "$2"
  else
    cd $(basename "$1" .git)
  fi
  if [[ -r "./yarn.lock" ]]; then
    yarn
  elif [[ -r "./pnpm-lock.yaml" ]]; then
    pnpm install
  elif [[ -r "./package-lock.json" ]]; then
    npm install
  fi
}
