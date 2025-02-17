#!/bin/bash

# Installs VSCodium

# shellcheck disable=SC1091
. "$HOME/.dotfiles/tools/reports.sh"

set -e
trap on_error SIGTERM

install_codium() {
  if [ ! -d "/Applications/VSCodium.app" ]; then
    version=1.92.2.24228

    info "downloading https://github.com/VSCodium/vscodium/releases/download/$version/VSCodium.arm64.$version.dmg..."
    wget --output-document=/tmp/vscodium.dmg https://github.com/VSCodium/vscodium/releases/download/$version/VSCodium.arm64.$version.dmg

    info 'mounting downloaded file...'
    hdiutil attach /tmp/vscodium.dmg

    info 'copying downloaded file...'
    sudo cp -R /Volumes/VSCodium/VSCodium.app /Applications

    info 'unmounting downloaded file...'
    hdiutil unmount /Volumes/VSCodium

    info 'cleaning up...'
    sudo rm -rf /tmp/vscodium.dmg
  fi

  info 'skipped installing VSCodium.app'

  finish
}

main() {
  install_codium "$"
  on_finish "$*"
}

main "$*"
