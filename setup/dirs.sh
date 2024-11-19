#!/usr/bin/env bash

# Install dependencies and software

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reporter.sh"

set -e
trap on_error SIGTERM

home="$HOME"
dots_config="$DOTFILES"/config
home_config="$HOME"/.config
dots_shell="$DOTFILES"/shell

function create_home_dirs() {
  info "Creating ~/ directories ..."

  read -rp "Do you want to create ~/ directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=(".config" ".ssh" ".tmux" ".vim")

  for d in "${dirs[@]}"; do
    mkdir -p "$home/$d" || error "Failed to create ~/$d directory ..."
    success "created $d directory"
  done

  finish
}

function link_home_files() {
  info "Linking ~/ files..."

  read -rp "Do you want to link ~/* files ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  ln -sf "$dots_shell/zshrc" "$home/.zshrc" || error "Failed to link zshrc ..."
  ln -sf "$dots_shell/zshenv" "$home/.zshenv" || error "Failed to link zshenv ..."
  ln -sf "$dots_shell/zprofile" "$home/.zprofile" || error "Failed to link zprofile ..."
  ln -sf "$dots_shell/zlogin" "$home/.zlogin" || error "Failed to link zlogin ..."
  success "linked ~/.zsh files"

  ln -sf "$dots_config/tmux/tmux.conf" "$home/.tmux.conf" || error "Failed to link tmux.conf ..."
  success "linked ~/.tmux.conf file"

  ln -sf "$dots_config/vim/vimrc" "$home/.vimrc" || error "Failed to link vimrc ..."
  success "linked ~/.vimrc file"

  ln -sf "$dots_config/git/gitconfig" "$home/.gitconfig" || error "Failed to link gitconfig ..."
  ln -sf "$dots_config/git/gitignore" "$home/.gitignore" || error "Failed to link gitignore ..."
  success "linked ~/.git files"

  cp "$dots_config/ssh/config" "$home/.ssh/config" || error "Failed to copy to ~.ssh/config"
  success "coppied ~/.ssh/config file"

  if [ ! -e "$home"/.gitsecret ]; then
    printf '[user]\n  signingkey = ' >"$home"/.gitsecret || error "Failed to create ~/.gitsecret file ..."
    success "created ~/.gitsecret file"
  fi

  printf '' >"$home"/.hushlogin || error "Failed to create ~/.hushlogin file ..."
  success "created ~/.hushlogin file"

  finish
}

function create_config_dirs() {
  info "Creating config directories..."

  read -rp "Do you want create config directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=("alacritty" "atuin" "gh" "kitty" "ranger" "skhd" "wezterm" "yabai" "yazi")
  for d in "${dirs[@]}"; do
    mkdir -p "$home_config/$d" || error "Failed to create $d directory ..."
    success "created $home_config/$d directory"
  done

  finish
}

function link_config_files() {
  info "Linking config files..."

  read -rp "Do you want to link ~/.config/* files ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=("alacritty" "gh" "kitty" "ranger" "skhd" "wezterm" "yabai" "yazi")

  ln -sf "$dots_config/alacritty/alacritty.toml" "$home_config/alacritty/alacritty.toml" || error "Failed to link $home_config/alacritty/alacritty.toml..."
  ln -sf "$dots_config/atuin/config.toml" "$home_config/atuin/config.toml" || error "Failed to link $home_config/atuin/config.toml..."
  ln -sf "$dots_config/gh/config.yml" "$home_config/gh/config.yml" || error "Failed to link $home_config/gh/config.yml..."
  ln -sf "$dots_config/kitty/kitty.conf" "$home_config/kitty/kitty.conf" || error "Failed to link $home_config/kitty/kitty.conf..."
  ln -sf "$dots_config/ranger/rc.conf" "$home_config/ranger/rc.conf" || error "Failed to link $home_config/ranger/rc.conf..."
  ln -sf "$dots_config/skhd/skhdrc" "$home_config/skhd/skhdrc" || error "Failed to link $home_config/skhd/skhdrc..."
  ln -sf "$dots_config/wezterm/wezterm.lua" "$home_config/wezterm/wezterm.lua" || error "Failed to link $home_config/wezterm/wezterm.lua..."
  ln -sf "$dots_config/yabai/yabairc" "$home_config/yabai/yabairc" || error "Failed to link $home_config/yabai/yabairc..."
  ln -sf "$dots_config/yazi/yazi.toml" "$home_config/yazi/yazi.toml" || error "Failed to link $home_config/yazi/yazi.toml..."
  ln -sf "$dots_config/yazi/theme.toml" "$home_config/yazi/theme.toml" || error "Failed to link $home_config/yazi/theme.toml..."
  ln -sf "$dots_config/yazi/keymap.toml" "$home_config/yazi/keymap.toml" || error "Failed to link $home_config/yazi/keymap.toml..."
  ln -sf "$dots_config/yazi/init.lua" "$home_config/yazi/init.lua" || error "Failed to link $home_config/yazi/init.lua..."
  success "linked ~/.config/*/* files"

  finish
}

function create_work_dirs() {
  info "Creating working directories..."

  read -rp "Do you want to create working directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=("Projects" "Projects/class" "Projects/exts" "Projects/repos" "Projects/served")

  for d in "${dirs[@]}"; do
    mkdir -p "$home/$d" || error "Failed to create ~/$d directory ..."
    success "created $home/$d directory"
  done

  finish
}

function main() {
  create_home_dirs "$*"
  link_home_files "$*"
  create_config_dirs "$*"
  link_config_files "$*"
  create_work_dirs "$*"
}

main "$*"
