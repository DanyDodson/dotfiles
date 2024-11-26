#!/bin/bash

# Installs Homebrew, Xcode tools

# shellcheck disable=SC1091
. "$HOME/.dotfiles/setup/reports.sh"

set -e
trap on_error SIGTERM

# install xcode tools and accept its license
function install_xcode() {
  if ! exists xcode-select; then
    read -rp "Do you want to install xcode tools? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    info "\nInstalling XCode command line tools..."
    xcode-select --install
    echo
    info "Accepting XCode license..."
    xcodebuild -license
  else
    success "Xcode Tools are already installed. Skipping..."
  fi
  finish
}

# install Homebrew
function install_homebrew() {
  if ! command -v brew >/dev/null 2>&1; then
    read -rp "Do you want to install homebrew? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    info "\nInstalling Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    success "Homebrew is already installed. Skipping..."
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
    info "Installing brew bundle apps..."
    cd "$DOTFILES" || exit
    brew bundle install --file "$HOME"/.dotfiles/config/brew/brewfile
  else
    error "Error: brew is not available"
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

# install npm packages
function install_npm_deps() {
  if exists npm; then
    read -rp "Do you want to install npm global packages yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    echo
    info "Installing npm global packages..."
    npm install -g bash-handbook
    npm install -g nodemon
    npm install -g neovim
    npm install -g pnpm
    npm install -g yarn
    echo
  else
    error "Error: npm is not available"
  fi
  finish
}

# TODO create function to auto install tmux and packages like this:
# if "test ! -d ~/.tmux/plugins/tpm" \
#  "run 'git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins'"

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
    echo
  else
    error "Error: pyenv is not available"
  fi
  finish
}

# install python packages
function install_python_packages() {
  if exists pyenv; then
    read -rp "Do you want to install python packages yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    info "Installing python packages..."
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip setuptools
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip pynvim
    echo
  else
    error "Error: python is not available"
  fi
  finish
}

# install go packages
function install_go_packages() {
  if exists pyenv; then
    read -rp "Do you want to install go packages yet? [y/N] " -n 1 answer
    echo
    if [ "${answer}" != "y" ]; then
      return
    fi
    info "Installing go packages..."
    go install golang.org/x/tools/gopls@latest
    go install github.com/cweill/gotests/gotests@latest
    go install github.com/fatih/gomodifytags@latest
    go install github.com/josharian/impl@latest
    go install github.com/go-delve/delve/cmd/dlv@latest
    go install honnef.co/go/tools/cmd/staticcheck@latest
    echo
  else
    error "Error: go is not available"
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
  install_python_packages "$*"
  install_go_packages "$*"
  on_finish "$*"
}

main "$*"
