#!/usr/bin/env zsh

if [ -f "/opt/homebrew/bin/gdircolors" ]; then
  eval "$(gdircolors -b "${DOTFILES}"/config/dircolors/dircolors-onedark)"
fi