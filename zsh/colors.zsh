#!/usr/bin/env zsh

# ls colors - https://geoff.greer.fm/lscolors/
if [ -f "/opt/homebrew/bin/gdircolors" ]; then
  eval "$(gdircolors -b "${DOTFILES}"/config/dircolors/dircolors-full)"
  alias ls='/opt/homebrew/bin/gls --color=auto --human-readable --group-directories-first -I .DS_Store -I .Trash -I "Icon'$'\r"'
  alias l='ls -A'
  alias ll='ls -Algoh'
  alias la='ls -Al'
fi
