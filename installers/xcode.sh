#!/bin/bash -ex

# shut down Xcode
killall Xcode

# create the themes folder if it doesn't exist
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes

# download the theme straight into the themes folder
curl -o ~/Library/Developer/Xcode/UserData/FontAndColorThemes/TokyoNight.xccolortheme https://raw.githubusercontent.com/mesqueeb/TokyoNightXcodeTheme/refs/heads/main/TokyoNight.xccolortheme

# open Xcode
open -a Xcode