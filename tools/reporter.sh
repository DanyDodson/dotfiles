#!/usr/bin/env bash

e='\033'
RESET="${e}[0m"
BOLD="${e}[1m"
CYAN="${e}[0;96m"
RED="${e}[0;91m"
YELLOW="${e}[0;93m"
GREEN="${e}[0;92m"

_exists() {
  command -v "$1" >/dev/null 2>&1
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

# End reporter
finish() {
  success "Done!"
  echo
  sleep 1
}

# Start reporter
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
  echo
  read -rp "Do you want to proceed with installation? [y/N] " -n 1 answer
  echo
  if [ "${answer}" != "y" ]; then
    exit
  fi
}

# Finished reporter
on_finish() {
  success "Everything was successfully done!"
  success "Happy Coding!"
  echo
  echo -ne "$RED"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"',------,'"$RESET"
  echo -ne "$YELLOW"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"'|   /\_/'\'"$RESET"
  echo -ne "$GREEN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-'
  echo -e "$RESET""$BOLD"'~|__( ^ .^)'"$RESET"
  echo -ne "$CYAN"'-_-_-_-_-_-_-_-_-_-_-_-_-_-_'
  echo -e "$RESET""$BOLD"'""  ""'"$RESET"
  echo
  info "P.S: Don't forget to restart a terminal :)"
  echo
}
