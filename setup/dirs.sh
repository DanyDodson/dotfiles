#!/usr/bin/env bash

# Install dependencies and software

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/report.sh"

set -e
trap on_error SIGTERM

# Link files to $HOME
info "Linking .zsh files..."
mkdir -p "$HOME"/.cache/zsh
ln -sf "$DOTFILES/shell/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/shell/zshenv" "$HOME/.zshenv"
ln -sf "$DOTFILES/shell/zprofile" "$HOME/.zprofile"
ln -sf "$DOTFILES/shell/zlogin" "$HOME/.zlogin"

info "Linking .git files..."
ln -sf "$DOTFILES/config/git/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/config/git/gitignore" "$HOME/.gitignore"

info "Creating a .gitsecret file..."
printf '[user]\n  signingkey = ' > ~/.gitsecret

info "Linking .vim files..."
mkdir -p "$HOME"/.vim
ln -sf "$DOTFILES/config/vim/vimrc" "$HOME/.vimrc"

info "Linking .tmux files..."
mkdir -p "$HOME"/.tmux
ln -sf "$DOTFILES/config/tmux/tmux.conf" "$HOME/.tmux.conf"

info "Linking .ssh files..."
mkdir -p "$HOME"/.ssh
cp "$DOTFILES/config/ssh/config" "$HOME/.ssh/config"

# Create a .hushlogin file
info "Creating a .hushlogin files..."
echo '' > ~/.hushlogin

# Create directories in $HOME/.config/*
info "Creating config/* directories..."
mkdir -p "$HOME"/.config/alacritty
mkdir -p "$HOME"/.config/gh
mkdir -p "$HOME"/.config/kitty
mkdir -p "$HOME"/.config/ranger
mkdir -p "$HOME"/.config/skhd
mkdir -p "$HOME"/.config/wezterm
mkdir -p "$HOME"/.config/yabai
mkdir -p "$HOME"/.config/yazi

# Link files to $HOME/.config/*
info "Linking config/* files..."
ln -sf "$DOTFILES/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$DOTFILES/config/gh/config.yaml" "$HOME/.config/gh/config.yaml"
ln -sf "$DOTFILES/config/gh/hosts.yaml" "$HOME/.config/gh/hosts.yaml"
ln -sf "$DOTFILES/config/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sf "$DOTFILES/config/ranger/rc.conf" "$HOME/.config/ranger/rc.conf"
ln -sf "$DOTFILES/config/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"
ln -sf "$DOTFILES/config/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"
ln -sf "$DOTFILES/config/yabai/yabairc" "$HOME/.config/yabai/yabairc"
ln -sf "$DOTFILES/config/yazi/yazi.toml" "$HOME/.config/yazi/yazi.toml"
ln -sf "$DOTFILES/config/yazi/theme.toml" "$HOME/.config/yazi/theme.toml"
ln -sf "$DOTFILES/config/yazi/keymap.toml" "$HOME/.config/yazi/keymap.toml"
ln -sf "$DOTFILES/config/yazi/init.lua" "$HOME/.config/yazi/init.lua"

# Create working directories
info "Creating working directories..."
mkdir -p ~/Projects
mkdir -p ~/Projects/class
mkdir -p ~/Projects/exts
mkdir -p ~/Projects/repos
mkdir -p ~/Projects/served