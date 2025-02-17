#!/bin/bash

# Set up tmux and install plugins

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

setup_yazi() {

	finish
}

main() {
	setup_yazi "$"
	on_finish "$*"
}

main "$*"
