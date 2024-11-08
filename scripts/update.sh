#!/usr/bin/env bash

# Get System Updates, update NPM packages and dotfiles
# Source: https://github.com/sapegin/dotfiles/blob/master/setup/update.sh

trap on_error SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Success reporter
info() {
  echo -e "${CYAN}${*}${RESET}"
}

# Error reporter
error() {
  echo -e "${RED}${*}${RESET}"
}

# Success reporter
success() {
  echo -e "${GREEN}${*}${RESET}"
}

# End section
finish() {
  success "Done!"
  echo
  sleep 1
}

# Set directory
export DOTFILES=${1:-"$HOME/.dotfiles"}

on_start() {
  info '                                                '
  info '           __        __   ____ _  __            '
  info '      ____/ /____   / /_ / __/(_)/ /___   _____ '
  info '     / __  // __ \ / __// /_ / // // _ \ / ___/ '
  info '  _ / /_/ // /_/ // /_ / __// // //  __/(__  )  '
  info ' (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/   '
  info '                                                '
  info '                                                '
}

update_omz() {
  if [ ! -d ~/.omz ]; then
    return
  fi

  info "Updating oh-my-zsh..."

  "$ZSH/tools/upgrade.sh"

  finish
}

update_brew() {
  if ! _exists brew; then
    return
  fi

  info "Updating Homebrew..."

  brew update
  brew upgrade
  brew autoremove
  brew cleanup --prune=all -s

  finish
}

update_apple_software() {
  if ! _exists softwareupdate; then
    return
  fi

  info "Updating Apple installed packages..."

  sudo softwareupdate -i -a

  finish
}

on_finish() {
  success "Done!"
  success "Happy Coding!"
  echo
  echo -ne "$RED"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"',------,'"$RESET"
  echo -ne "$YELLOW"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"'|   /\_/'\'"$RESET"
  echo -ne "$GREEN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e "$RESET""$BOLD"'~|__( ^ .^)'"$RESET"
  echo -ne "$CYAN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"'""  ""'"$RESET"
  echo
}

on_error() {
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  exit 1
}

main() {
  echo "Before we proceed, please type your sudo password:"
  sudo -v

  on_start "$*"
  update_omz "$*"
  update_brew "$*"
  update_apple_software "$*"
  on_finish "$*"
}

main "$*"
