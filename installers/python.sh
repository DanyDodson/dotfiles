#!/bin/bash

# Installs pyenv, python, and pips

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

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
  finish 'python install complete!'
}

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
    "$HOME"/.pyenv/shims/python -m pip install --upgrade pip rich
    echo
  else
    error "Error: python is not available"
  fi
  finish 'pip packages installed!'
}

main() {
  install_python_with_pyenv "$*"
  install_python_packages "$*"
  on_finish "$*"
}

main "$*"
