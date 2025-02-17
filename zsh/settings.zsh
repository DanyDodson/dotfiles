#!/usr/bin/env zsh

# history settings
export HISTFILE="$HOME/.zsh_history" # Sets the file where history is saved
export HISTSIZE=1000000000           # Sets maximum history entries in memory
export SAVEHIST=$HISTSIZE            # Sets maximum history entries in file

setopt APPEND_HISTORY          # Adds history entries as they are executed
setopt EXTENDED_HISTORY        # Saves timestamp and duration for commands
setopt INC_APPEND_HISTORY      # Adds commands to history immediately
setopt SHARE_HISTORY           # Shares history across multiple zsh sessions
setopt HIST_EXPIRE_DUPS_FIRST  # Removes duplicate commands first when trimming history
setopt HIST_FIND_NO_DUPS       # Skips duplicate entries when searching history
setopt HIST_IGNORE_ALL_DUPS    # Removes older duplicate entries in history
setopt HIST_IGNORE_SPACE       # Ignores commands that start with a space
setopt HIST_SAVE_NO_DUPS       # Prevents duplicate entries from being saved
setopt HIST_REDUCE_BLANKS      # Removes extra blank spaces from commands
setopt HIST_VERIFY             # Shows history expansion before executing

# History search
bindkey '^[[A' history-substring-search-up    # Up arrow for searching history backwards
bindkey '^[[B' history-substring-search-down  # Down arrow for searching history forwards

# Vim keymaps history search
bindkey -M vicmd 'k' history-substring-search-up    # Vim 'k' key for searching history backwards
bindkey -M vicmd 'j' history-substring-search-down  # Vim 'j' key for searching history forwards

# LS_COLORS - https://geoff.greer.fm/lscolors/
if [ -f "/opt/homebrew/bin/gdircolors" ]; then
  source "${DOTFILES}"/config/lscolors/lscolors.sh
  eval "$(gdircolors -b "${DOTFILES}"/config/lscolors/ls_colors)"
fi

# Complist and Colors
zmodload -i zsh/complist       # Loads the completion system module
autoload -Uz colors && colors  # Enables color support in the shell

# Enable gnu ls in macOS
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes  # Uses GNU ls formatting in MacOS

# Completion menu and grouping settings
zstyle ':completion:*:*:*:*:*' menu select            # Enables interactive menu for completions
zstyle ':completion:*:matches' group yes              # Groups similar matches together
zstyle ':completion:*:options' description yes        # Shows descriptions for options
zstyle ':completion:*:options' auto-description '%d'  # Automatic descriptions for options

# Formatting for different completion messages
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'  # Format for corrections
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'           # Configures how completion descriptions appear
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'                # Format for messages
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'      # Format for no matches
zstyle ':completion:*:default' list-prompt '%S%M matches%s'                    # Format for match count

# General completion behavior
# zstyle ':completion:*' format ' %F{yellow}-- %d --%f'                             # Configures how completion headers appear in the shell
zstyle ':completion:*' list-dirs-first yes                                          # Lists directories first
zstyle ':completion:*' group-name ''                                                # Groups completions by name
zstyle ':completion:*' verbose yes                                                  # Shows detailed completion info
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'     # Case-insensitive matching
zstyle ':completion:*' expand yes                                                   # Expands aliases before completing
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'  # Process completion
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.log'                    # Log file completion for redirections


# Caching completions
zstyle ':completion:*' use-cache on             # Enables completion caching
zstyle ':completion:*' cache-path ${ZSH}/cache  # Sets cache location

# Fuzzy matching settings
zstyle ':completion:*' completer _complete _match _approximate  # Enables fuzzy matching
zstyle ':completion:*:match:*' original only                    # Only shows original matches
zstyle ':completion:*:approximate:*' max-errors 1 numeric       # Allows 1 error in completion

# Directory and color settings
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}                                         # Uses ls colors for completion
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories            # Directory completion order
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select                                         # Directory stack menu
zstyle ':completion:*:-tilde-:*' group-order 'path-directories' 'named-directories' 'users' 'expand'  # Tilde completion order
zstyle ':completion:*' squeeze-slashes true                                                           # Combines multiple slashes

# Function and parameter handling
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'  # Ignores certain functions
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters              # Subscript completion order

# Manual page settings
zstyle ':completion:*:manuals' separate-sections true      # Separates manual sections
zstyle ':completion:*:manuals.(^1*)' insert-sections true  # Inserts section headers

# History completion settings
zstyle ':completion:*:history-words' stop yes             # Enables history word completion
zstyle ':completion:*:history-words' remove-all-dups yes  # Removes duplicates
zstyle ':completion:*:history-words' list false           # Disables listing
zstyle ':completion:*:history-words' menu yes             # Enables menu

# Multiple entry handling
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other  # Ignores current line for certain commands
zstyle ':completion:*:rm:*' file-patterns '*:all-files'    # File patterns for rm command

# Location for completions
zcompdump="${HOME}/.zcompdump"

# Load completions if present
if [ -f $zsh_dump_file ]; then
    compinit -d $zcompdump
fi

# Only perform compinit once a day
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]];
then
    zcompile "$zcompdump"
fi

# Disable pattern matching
unsetopt extendedglob # Disable extended globbing so that ^ will behave as normal

# nvm autoload node version
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version="$(nvm version "$(<"$nvmrc_path")")"

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
