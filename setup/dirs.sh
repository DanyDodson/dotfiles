#!/usr/bin/env bash

# Install dependencies and software

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

home="$HOME"
dots_config="$DOTFILES"/config
home_config="$HOME"/.config
dots_shell="$DOTFILES"/shell

function create_home_dirs() {
  info "Creating $home/* directories..."

  read -rp "Do you want to create $home/* directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=(".config" ".ssh" ".tmux" ".vim")

  for d in "${dirs[@]}"; do
    mkdir -p "$home/$d" || error "Failed to create $home/$d directory..."
    success "created $home/$d directory"
  done

  finish
}

function link_home_files() {
  info "Linking $home/* files..."

  read -rp "Do you want to link $home/* files ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  ln -sf "$dots_shell/zshrc" "$home/.zshrc" || error "Failed to link $home/.zshrc..."
  success "linked $home/.zshrc file"
  ln -sf "$dots_shell/zshenv" "$home/.zshenv" || error "Failed to link $home/.zshenv..."
  success "linked $home/.zshenv file"
  ln -sf "$dots_shell/zprofile" "$home/.zprofile" || error "Failed to link $home/.zprofile..."
  success "linked $home/.zprofile file"
  ln -sf "$dots_shell/zlogin" "$home/.zlogin" || error "Failed to link $home/.zlogin..."
  success "linked $home/.zlogin files"
  ln -sf "$dots_config/tmux/tmux.conf" "$home/.tmux.conf" || error "Failed to link $home/.tmux.conf..."
  success "linked $home/.tmux.conf file"
  ln -sf "$dots_config/vim/vimrc" "$home/.vimrc" || error "Failed to link $home/.vimrc..."
  success "linked $home/.vimrc file"
  ln -sf "$dots_config/git/gitconfig" "$home/.gitconfig" || error "Failed to link $home/.gitconfig..."
  success "linked $home/.gitconfig file"
  ln -sf "$dots_config/git/gitignore" "$home/.gitignore" || error "Failed to link $home/.gitignore..."
  success "linked $home/.gitignore file"
  ln -sf "$dots_config/ssh/config" "$home/.ssh/config" || error "Failed to link $home/.ssh/config"
  success "linked $home/.ssh/config file"

  if [ ! -e "$home"/.gitsecret ]; then
    printf '[user]\n  signingkey = ' >"$home"/.gitsecret || error "Failed to create $home/.gitsecret file..."
    success "created $home/.gitsecret file"
  fi

  if [ ! -e "$home"/.hushlogin ]; then
    printf '' >"$home"/.hushlogin || error "Failed to create $home/.hushlogin file..."
    success "created $home/.hushlogin file"
  fi

  finish
}

function create_config_dirs() {
  info "Creating $home_config/* directories..."

  read -rp "Do you want create $home_config/* directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=("alacritty" "gh" "kitty" "ranger" "skhd" "wezterm" "yabai" "yazi")
  for d in "${dirs[@]}"; do
    mkdir -p "$home_config/$d" || error "Failed to create $home_config/$d directory..."
    success "created $home_config/$d directory"
  done

  finish
}

function link_config_files() {
  info "Linking $dots_config files..."

  read -rp "Do you want to link $dots_config files ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  ln -sf "$dots_config/alacritty/alacritty.toml" "$home_config/alacritty/alacritty.toml" || error "Failed to link $home_config/alacritty/alacritty.toml..."
  success "linked $dots_config/alacritty/alacritty.toml"
  ln -sf "$dots_config/gh/config.yml" "$home_config/gh/config.yml" || error "Failed to link $home_config/gh/config.yml..."
  success "linked $dots_config/gh/config.yml"
  ln -sf "$dots_config/kitty/kitty.conf" "$home_config/kitty/kitty.conf" || error "Failed to link $home_config/kitty/kitty.conf..."
  success "linked $dots_config/kitty/kitty.conf"
  ln -sf "$dots_config/ranger/rc.conf" "$home_config/ranger/rc.conf" || error "Failed to link $home_config/ranger/rc.conf..."
  success "linked $dots_config/ranger/rc.conf"
  ln -sf "$dots_config/skhd/skhdrc" "$home_config/skhd/skhdrc" || error "Failed to link $home_config/skhd/skhdrc..."
  success "linked $dots_config/skhd/skhdrc"
  ln -sf "$dots_config/wezterm/wezterm.lua" "$home_config/wezterm/wezterm.lua" || error "Failed to link $home_config/wezterm/wezterm.lua..."
  success "linked $dots_config/wezterm/wezterm.lua"
  ln -sf "$dots_config/yabai/yabairc" "$home_config/yabai/yabairc" || error "Failed to link $home_config/yabai/yabairc..."
  success "linked $dots_config/yabai/yabairc"
  ln -sf "$dots_config/yazi/yazi.toml" "$home_config/yazi/yazi.toml" || error "Failed to link $home_config/yazi/yazi.toml..."
  success "linked $dots_config/yazi/yazi.toml"
  ln -sf "$dots_config/yazi/theme.toml" "$home_config/yazi/theme.toml" || error "Failed to link $home_config/yazi/theme.toml..."
  success "linked $dots_config/yazi/theme.toml"
  ln -sf "$dots_config/yazi/keymap.toml" "$home_config/yazi/keymap.toml" || error "Failed to link $home_config/yazi/keymap.toml..."
  success "linked $dots_config/yazi/keymap.toml"
  ln -sf "$dots_config/yazi/init.lua" "$home_config/yazi/init.lua" || error "Failed to link $home_config/yazi/init.lua..."
  success "linked $dots_config/yazi/init.lua"

  finish
}

function create_work_dirs() {
  info "Creating $home/Project/* directories..."

  read -rp "Do you want to create $home/Project/* directories ? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    return
  fi

  local dirs=("Projects" "Projects/class" "Projects/exts" "Projects/repos" "Projects/served")

  for d in "${dirs[@]}"; do
    mkdir -p "$home/$d" || error "Failed to create $home/$d directory ..."
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
  on_finish "$*"
}

main "$*"
