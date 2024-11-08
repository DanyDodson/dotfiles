#!/usr/bin/env bash

# Logging

__info() { printf '\033[0;34m[INFO] \033[0;34m%s\033[0;m\n' "$1"; }
__info_() { printf '\033[0;34m %s\033[0;m\n' "$1"; }
# __info "Info..."
# __info_ "Info..."

__user() { printf '\033[0;35m[USER] \033[0;35m%s\033[0;m\n' "$1"; }
__user_() { printf '\033[0;35m %s\033[0;m\n' "$1"; }
# __user "User..."
# __user_ "User_..."

__ok() { printf '\033[0;33m[OK] \033[0;36m%s\033[0;m\n' "$1"; }
__ok_() { printf '\033[0;36m %s\033[0;m\n' "$1"; }
__ok "Okay this is working..."
# __ok_ "Okay..."

__warn() { printf '\033[0;32m[WARN] \033[0;32m%s\033[0;m\n' "$1"; }
__warn_() { printf '\033[0;32m %s\033[0;m\n' "$1"; }
# __warn "Warning..."
# __warn_ "Warning..."

__err() { printf '\033[0;31m[ERR] \033[0;31m%s\033[0;m\n' "$1"; }
__err_() { printf '\033[0;31m %s\033[0;m\n' "$1"; }
# __err "Error..."
# __err_ "Error..."

__warning() { printf '\033[0;32m[WARNING] %s\033[0;m\n' "$1" >&2; }
__warning_() { printf '\033[0;32m %s\033[0;m\n' "$1" >&2; }
# __warning "Warning..."
# __warning_ "Warning..."

# __error() { printf '\033[31m[ERROR]\033[0m %s\n' "$1" >&2; }
# __error_() { printf '\033[0;31m %s\033[0;m\n' "$1" >&2; }
# __error "Error..."
# __error_ "Error..."