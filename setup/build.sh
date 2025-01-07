#!/usr/bin/env bash

# Install dependencies and software

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap 'on_error; exit 1' SIGTERM

home="$HOME"
dotfiles="$HOME/.dotfiles"
home_config="$HOME/.config"

create_dirs() {
  local dir_array=("$@")
  local prompt="Do you want to create the following directories? [y/N]: ${dir_array[*]}"

  read -r -p "$prompt" -n 1 answer
  echo

  case "$answer" in
  y | Y)
    for dir in "${dir_array[@]}"; do
      mkdir -p "$dir" || error "Failed to create directory: $dir"
      success "Created directory: $dir"
    done
    ;;
  esac
}

create_symlinks() {
  local link_array=("$@")
  local prompt="Do you want to create the following symlinks? [y/N]: ${link_array[*]}"

  read -r -p "$prompt" -n 1 answer
  echo

  case "$answer" in
  y | Y)
    for link in "${link_array[@]}"; do
      target=$(echo "$link" | cut -d' ' -f2-) # Extract target from space-separated string
      source=$(echo "$link" | cut -d' ' -f1)  # Extract source from space-separated string

      ln -sf "$source" "$target" || error "Failed to create symlink: $link"
      success "Created symlink: $link"
    done
    ;;
  esac
}

home_dirs=(
  "$home/.config"
  "$home/.ssh"
  "$home/.tmux"
  "$home/.vim"
)

home_symlinks=(
  "$dotfiles/shell/zshrc $home/.zshrc"
  "$dotfiles/shell/zshenv $home/.zshenv"
  "$dotfiles/shell/zprofile $home/.zprofile"
  "$dotfiles/shell/zlogin $home/.zlogin"
  "$dotfiles/config/tmux/tmux.conf $home/.tmux.conf"
  "$dotfiles/config/vim/vimrc $home/.vimrc"
  "$dotfiles/config/git/gitconfig $home/.gitconfig"
  "$dotfiles/config/git/gitignore $home/.gitignore"
  "$dotfiles/config/ssh/config $home/.ssh/config"
)

config_dirs=(
  "$home_config/1password" "$home_config/alacritty" "$home_config/gh" "$home_config/"
  "$home_config/ranger" "$home_config/skhd" "$home_config/" "$home_config/yabai"
  "$home_config/yazi"
)

config_symlinks=(
  "$dotfiles/config/1password/ssh/agent.toml $home_config/1password/ssh/agent.toml"
  "$dotfiles/config/alacritty/alacritty.toml $home_config/alacritty/alacritty.toml"
  "$dotfiles/config/gh/config.yml $home_config/gh/config.yml"
  "$dotfiles/config/skhd/skhdrc $home_config/skhd/skhdrc"
  "$dotfiles/config/yabai/yabairc $home_config/yabai/yabairc"
  "$dotfiles/config/yazi/yazi.toml $home_config/yazi/yazi.toml"
  "$dotfiles/config/yazi/theme.toml $home_config/yazi/theme.toml"
  "$dotfiles/config/yazi/keymap.toml $home_config/yazi/keymap.toml"
  "$dotfiles/config/yazi/init.lua $home_config/yazi/init.lua"
)

work_dirs=(
  "$home/Projects"
  "$home/Projects/class"
  "$home/Projects/exts"
  "$home/Projects/repos"
  "$home/Projects/served"
)

# Create empty files if they don't exist
create_empty_file() {
  local file="$1"
  local content="$2"

  if [ ! -e "$file" ]; then
    printf "%s" "$content" >"$file" || error "Failed to create file: $file"
    success "Created file: $file"
  fi
}

main() {
  create_dirs "${home_dirs[@]}"
  create_symlinks "${home_symlinks[@]}"
  create_dirs "${config_dirs[@]}"
  create_symlinks "${config_symlinks[@]}"
  create_dirs "${work_dirs[@]}"
  create_empty_file "$home/.gitsecret" "[user]\n  signingkey ="
  create_empty_file "$home/.hushlogin" ""
  on_finish
}

main
