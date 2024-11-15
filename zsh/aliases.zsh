#!/usr/bin/env zsh

_exists() {
  command -v $1 >/dev/null 2>&1
}

alias src='omz reload'

alias c='clear'
alias o='open'
alias oo='open .'
alias e='$EDITOR'

if _exists nvim; then
  alias nv='nvim'
  alias dotconf='cd ~/.dotfiles && nvim'
  alias nvconf='cd ~/.config/nvim && nvim'
fi

if _exists trash; then
  alias rm='trash .'
fi

if _exists codium; then
  alias cc='codium .'
fi

if _exists wget; then
  alias wget="wget --no-check-certificate"
fi

if _exists curl; then
  alias get="curl -O -L --silent"
fi

if _exists npm; then
  alias lsg-npm='npm ls -g --depth 0'
fi

if _exists yarn; then
  alias lsg-yarn='yarn global list'
fi

if _exists bun; then
  alias lsg-bun='bun pm ls --global'
fi

if _exists pnpm; then
  alias lsg-pnpm='pnpm ls -g'
fi

if _exists yazi; then
  alias yy='yazi'
fi

if _exists ranger; then
  alias rr='ranger'
fi

if _exists bat; then
  alias bat='bat --tabs=4 --wrap=never --style=plain --color=always'
  alias cat='bat'
fi

if _exists tmux; then
  alias tn='tmux new'
  alias tls='tmux ls'
  alias tk='tmux kill-session'
  alias td='tmux detach'
  alias ta='tmux a'
  alias tms='tmux source-file $HOME/.tmux.conf'
fi

if _exists brew; then
  alias bbin='brew bundle install --file=~/.dotfiles/config/brew/brewfile'
  alias bbcl='brew bundle cleanup --file=~/.dotfiles/config/brew/brewfile'
  alias bbch='brew bundle check --file=~/.dotfiles/config/brew/brewfile'
  alias bleaves='brew leaves | xargs brew desc --eval-all'
  alias bleavesc='brew ls --casks | xargs brew desc --eval-all'
fi

# GNU ls aliases
if _exists gls; then
  alias ls='/opt/homebrew/bin/gls --color=auto --human-readable --group-directories-first'
  alias ll='ls -lAh'
  alias l='ll'
fi

# Folders Shortcuts
[ -d ~/.dotfiles ] && alias dots='cd ~/.dotfiles'
[ -d ~/Downloads ] && alias dl='cd ~/Downloads'
[ -d ~/Projects ] && alias pj='cd ~/Projects'
[ -d ~/Projects/class ] && alias pclass='cd ~/Projects/class'
[ -d ~/Projects/repos ] && alias prepos='cd ~/Projects/repos'
[ -d ~/Projects/served ] && alias pserved='cd ~/Projects/served'

# Prints a cleaner $PATH and $FPATH
alias path='echo -e ${PATH//:/\\n}'
alias fpath='echo -e ${FPATH//:/\\n}'

# Get system info
alias sc_computername='scutil --get ComputerName'
alias sc_localhostname='scutil --get LocalHostName'
alias sc_hostname='scutil --get HostName'
alias sc_dns='scutil --dns'
alias sc_proxy='scutil --proxy'
alias sc_net_info='scutil --nwi'

# OSX's launchctl
alias launch_list='launchctl list '
alias launch_load='launchctl load '
alias launch_unload='launchctl unload '
alias launch_getenv='launchctl getenv '
alias launch_start='launchctl start '
alias launch_stop='launchctl stop '

# List installed Packages
alias sys_pkg_list='pkgutil --pkgs'

# OSX's Launch Services
alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'

# Get kMDItemContentTypeTree metadata for file
alias sys_uti_file='mdls -name kMDItemContentTypeTree '

# Turn spotlight on/off
alias spotlight_off='sudo mdutil -a -i off'
alias spotlight_on='sudo mdutil -a -i on'

# Spotlight Exclusions
alias spotlight_exclusion_show='sudo defaults read /.Spotlight-V100/VolumeConfiguration.plist Exclusions'
alias spotlight_exclusion_add='sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add '

# Spotlight Meta-data indexing (MDS)
alias spotlight_indexing_stop='sudo launchctl stop com.apple.metadata.mds'
alias spotlight_indexing_start='sudo launchctl start com.apple.metadata.md'
alias spotlight_indexing_restart='spotlight.indexing.stop && spotlight.indexing.start'
