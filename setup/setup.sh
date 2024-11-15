#!/bin/bash

# Installs Homebrew, Xcode tools

# shellcheck disable=SC1091
. "$HOME/.dotfiles/setup/reports.sh"

set -e
trap on_error SIGTERM

sudo -v

# Install Xcode tools and accept its license
function install_xcode() {
  if ! _exists xcode-select; then
    info "\nInstalling XCode command line tools..."

    xcode-select --install
    echo
    info "Accepting XCode license..."
    xcodebuild -license
    echo
  else
    success "\nXcode Tools are already installed. Skipping..."
  fi
  finish
}

# Install Homebrew
function install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    info "\nInstalling Homebrew..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    success "\nHomebrew is already installed. Skipping..."
  fi
  finish
}

# Homebrew
function install_software() {
  if _exists brew; then
    info "Installing Brew Bundle apps..."

    read -rp "Do you want to install apps from brewfile? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    cd "$DOTFILES" || exit
    brew bundle install --file "$HOME"/.dotfiles/config/brew/brewfile
  else
    error "Error: Brew is not available"
  fi
  finish
}

# Install npm and packages
function install_npm_deps() {
  if _exists npm; then
    info "Installing Node.js dependencies..."

    read -rp "Do you want to install npm packages yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi

    npm config set loglevel warn
    npm install -g nodemon
    npm install -g typescript
    echo
  else
    error "Error: npm is not available"
  fi
  finish
}

main() {
  on_start "$*"
  install_xcode "$*"
  install_homebrew "$*"
  install_software "$*"
  install_npm_deps "$*"
  on_finish "$*"
}

main "$*"
