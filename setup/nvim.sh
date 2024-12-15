#!/usr/bin/env bash

# Installs neovim head

. "$HOME/.dotfiles/setup/reports.sh"

target=nvim-macos-arm64
filename="$target.tar.gz"
downloads=$HOME/Downloads

wget -q -P "$downloads" "https://github.com/neovim/neovim/releases/download/nightly/$filename"

xattr -c "$downloads/$filename"
tar -xzf "$downloads/$filename"
mv "$target/bin/nvim" ~/.local/bin

rm -rf "${downloads:?}/${target}"
rm "$downloads"/$filename
