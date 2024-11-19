#!/bin/bash

# Installs Homebrew, Xcode tools

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

# install xcode tools and accept its license
function install_xcode() {
  if ! exists xcode-select; then
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

# install Homebrew
function install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    info "\nInstalling Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    success "\nHomebrew is already installed. Skipping..."
  fi
  finish
}

# homebrew
function install_software() {
  if exists brew; then
    read -rp "Do you want to install apps from brewfile? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    echo
    info "Installing Brew Bundle apps..."
    cd "$DOTFILES" || exit
    brew bundle install --file "$HOME"/.dotfiles/config/brew/brewfile
  else
    error "Error: Brew is not available"
  fi
  finish
}

# install node using nvm
export NVM_DIR=$HOME/.nvm
[[ -f "$NVM_DIR"/nvm.sh ]] && source "$NVM_DIR"/nvm.sh
function install_node_with_nvm() {
  if exists nvm; then
    read -rp "Do you want to install node using nvm yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    echo
    info "Installing node with nvm..."
    nvm install v22.11.0
    nvm use v22.11.0
    nvm install-latest-npm
    echo
  else
    error "Error: nvm is not available"
  fi
  finish
}

# install npm and packages
function install_npm_deps() {
  if exists npm; then
    read -rp "Do you want to install npm packages yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    echo
    info "Installing Node.js dependencies..."
    npm install -g bash-handbook
    npm install -g nodemon
    npm install -g pnpm
    npm install -g yarn
    echo
  else
    error "Error: npm is not available"
  fi
  finish
}

# install python with pyenv
function install_python_with_pyenv() {
  if exists pyenv; then
    read -rp "Do you want to install python using pyenv yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    info "Installing python with pyenv..."
    pyenv install 3.10.15
    pyenv global 3.10.15
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip setuptools
    echo
  else
    error "Error: pyenv is not available"
  fi
  finish
}

main() {
  on_start "$*"
  install_xcode "$*"
  install_homebrew "$*"
  install_software "$*"
  install_node_with_nvm "$*"
  install_npm_deps "$*"
  install_python_with_pyenv "$*"
  on_finish "$*"
}

main "$*"
