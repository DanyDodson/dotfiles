#!/usr/bin/env zsh

# history settings
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# ls colors - https://geoff.greer.fm/lscolors/
if [ -f "/opt/homebrew/bin/gdircolors" ]; then
  eval "$(gdircolors -b "${DOTFILES}"/config/dircolors/dircolors-full)"
fi

# color complist
zmodload -i zsh/complist
autoload -Uz colors && colors

# enable gnu ls in macos
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes

# group matches and describe
# https://thevaluable.dev/zsh-completion-guide-examples/
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' list-dirs-first yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' expand yes
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.log'

# completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ${ZSH}/cache

# fuzzy match mistyped completions
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# directories
# Zsh to use the same colors as ls - http://superuser.com/a/707567
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'path-directories' 'named-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# ignores unavailable commands
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'

# completion element sorting
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# history
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# ignore multiple entries
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# location for completions
zcompdump="${HOME}/.zcompdump"
# zcompdump="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/.zcompdump"

# if completions present, then load them
if [ -f $zsh_dump_file ]; then
    compinit -d $zcompdump
fi

# perform compinit only once a day.
if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]];
then
    zcompile "$zcompdump"
fi

# disable extended globbing so that ^ will behave as normal.
unsetopt extendedglob
