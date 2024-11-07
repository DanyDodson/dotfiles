#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

function dots() {
  cd ~/.dotfiles/ && nvim .
}

function nvconf() {
  cd ~/.config/nvim/ && nvim .
}

function batman() {
  BAT_THEME="OneHalfDark" command batman "$@"
  return $?
}

function cppubkey() {
  cat ~/.config/ssh/id_ed25519.pub | pbcopy | echo "=> Public key copied to pasteboard."
}

function ipv4() {
  dig -4 @resolver1.opendns.com myip.opendns.com A +short
}

function ipv6() {
  dig -6 @resolver1.opendns.com myip.opendns.com AAAA +short
}

function copy() {
  printf "%s" "$*" | tr -d "\n" | pbcopy
}

function yabai_error() {
  btail -f /tmp/yabai_"$USER"\.err.log
}

function yabai_debug() {
  tail -f /tmp/yabai_"$USER"\.out.log
}

function randpass() {
  local len=${1:-32}
  openssl rand -base64 256 | tr -d '\n/+=' | cut -c -"$len"
}

function clipboard() {
  if [ -t 0 ]; then
    pbpaste
  else
    pbcopy
  fi
}

function brew_leaves() {
  brew leaves | xargs brew desc --eval-all
}

function brew_leaves_casks() {
  brew ls --casks | xargs brew desc --eval-all
}
