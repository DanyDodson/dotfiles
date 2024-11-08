#!/usr/bin/env bash

# Dotfiles and bootstrap installer
# Installs homebrew, clones repository and symlinks dotfiles to your home directory

set -e
trap on_error SIGTERM

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v "$1" > /dev/null 2>&1
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
GITHUB_REPO_URL_BASE="https://github.com/danydodson/dotfiles"
HOMEBREW_INSTALLER_URL="https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh"

on_start() {
  info "                                               "
  info "                                               "
  info "           __        __   ____ _  __           "
  info "      ____/ /____   / /_ / __/(_)/ /___   _____"
  info "     / __  // __ \ / __// /_ / // // _ \ / ___/"
  info "  _ / /_/ // /_/ // /_ / __// // //  __/(__  ) "
  info " (_)\__,_/ \____/ \__//_/  /_//_/ \___//____/  "
  info "                                               "
  info "                                               "

  info "This script will guide you through installing homebrew, npm packages and the dofiles itself."
  echo
  read -rp "Do you want to proceed with installation? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    exit
  fi
}

install_xcode_tools() {
  info "Trying to detect installed Xcode Command Line Tools..."

  if ! _exists xcode-select; then
    echo "Seems like you don't have Xcode Command Line Tools installed!"
    read -rp "Do you agree to proceed with Xcode Command Line Tools installation? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi

    info "Installing Xcode Command Line Tools..."
    xcode-select --install

    info "Accepting XCode license..."
    xcodebuild -license

  else
    success "You already have Xcode Command Line Tools installed. Skipping..."
  fi

  finish
}

install_homebrew() {
  info "Trying to detect installed Homebrew..."

  if ! _exists brew; then
    echo "Seems like you don't have Homebrew installed!"
    read -rp "Do you agree to proceed with Homebrew installation? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi

    info "Installing Homebrew..."
    bash -c "$(curl -fsSL "${HOMEBREW_INSTALLER_URL}")"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    success "You already have Homebrew installed. Skipping..."
  fi

  finish
}

install_software() {
  if [ "$(uname)" != "Darwin" ]; then
    return
  fi

  info "Installing software..."

  cd "$DOTFILES" || exit

  # Homebrew Bundle
  if _exists brew; then
    brew bundle install --file="$DOTFILES"/macos/brewfile
  else
    error "Error: Brew is not available"
  fi

  cd - || exit

  finish
}

install_npm() {
  # Do not instal npm on non-macOS machines
  if [ "$(uname)" != "Darwin" ]; then
    return
  fi

  info "Installing global npm packages..."

  packages=(
    nodemon
  )

  echo "Installing: ${packages[*]}"

  npm install -g "${packages[@]}"

  finish
}

on_finish() {
  echo
  success "Setup was successfully done!"
  success "Happy Coding!"
  echo
  echo -ne "$RED"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"',------,'"$RESET"
  echo -ne "$YELLOW"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"'|   /\_/\\'"$RESET"
  echo -ne "$GREEN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e  "$RESET""$BOLD"'~|__( ^ .^)'"$RESET"
  echo -ne "$CYAN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e  "$RESET""$BOLD"'""  ""'"$RESET"
  echo
  info "P.S: Don't forget to restart a terminal :)"
  echo
}

on_error() {
  echo
  error "Wow... Something serious happened!"
  error "Though, I don't know what really happened :("
  error "In case, you want to help me fix this problem, raise an issue -> ${CYAN}${GITHUB_REPO_URL_BASE}issues/new${RESET}"
  echo
  exit 1
}

main() {
  on_start "$*"
  install_homebrew "$*"
  install_software "$*"
  install_npm "$*"
  on_finish "$*"
}

main "$*"
