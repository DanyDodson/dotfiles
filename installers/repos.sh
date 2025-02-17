#!/bin/bash

# clone my public repos from github

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

install_repos() {
  GH_USER=danydodson
  PAGE=1

  # create developer directory
  if [ ! -d "$HOME/Developer" ]; then
    info 'Creating dir ~/Developer...'
    mkdir -p "$HOME/Developer"
  fi

  cd ~/Developer/repos
  curl "https://api.github.com/users/$GH_USER/repos?page=$PAGE&per_page=100" | grep -F 'clone_url' | cut -d \" -f 4 | xargs -L1 git clone --recursive

  finish
}

main() {
  install_repos "$"
  on_finish "$*"
}

main "$*"
