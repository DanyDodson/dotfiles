#!/usr/bin/env bash

# Installs a version of VSCodium

. "$HOME/.dotfiles/setup/reports.sh"

version=1.92.2.24228

wget --output-document=/tmp/vscodium.dmg https://github.com/VSCodium/vscodium/releases/download/$version/VSCodium.arm64.$version.dmg
hdiutil attach /tmp/vscodium.dmg
sudo cp -R /Volumes/VSCodium/VSCodium.app /Applications
hdiutil unmount /Volumes/VSCodium
sudo rm -rf /tmp/vscodium.dmg

