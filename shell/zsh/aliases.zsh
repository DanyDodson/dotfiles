#!/usr/bin/env zsh

_exists() {
  command -v $1 >/dev/null 2>&1
}

# GNU ls aliases
alias ls='/opt/homebrew/bin/gls --color=auto --human-readable --group-directories-first'
alias ll='ls -lAh'
alias l='ll'

alias sudo='sudo '

alias src='source ~/.zshrc'

if _exists wget; then
  alias wget="wget --config=$HOME/.dotfiles/config/wget/wgetrc --no-check-certificate"
fi

if _exists curl; then
  alias curl='curl --silent'
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

if _exists brew; then
  alias bbinstall='brew bundle install --file=~/.dotfiles/macos/brewfile'
  alias bbclean='brew bundle cleanup --file=~/.dotfiles/macos/brewfile'
  alias bbcheck='brew bundle check --file=~/.dotfiles/macos/brewfile'
fi

if _exists ranger; then
  alias ra='ranger'
fi

if _exists bat; then
  alias bat='bat --tabs=4 --wrap=never --style=plain --color=always --theme="OneHalfDark"'
  alias cat='bat'
  alias man='batman'
  # alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
  # alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
fi

# diff
alias diff='colordiff'

# change dir
# alias ..='cd ..'
# alias ...='cd ../..'
# alias ....='cd ../../../..'

alias df='df -h'

# Pipe Aliases
alias grep='egrep --color=auto '
alias egrep='egrep --color=auto '

# Folders Shortcuts
[ -d ~/Downloads ] && alias dl='cd ~/Downloads'
[ -d ~/Projects ] && alias pj='cd ~/Projects'
[ -d ~/Projects/Code ] && alias pjc='cd ~/Projects/Code'
[ -d ~/Projects/Class ] && alias pjclass='cd ~/Projects/Class'
[ -d ~/Projects/Apps ] && alias pja='cd ~/Projects/Apps'
[ -d ~/Projects/Github ] && alias pjg='cd ~/Projects/Github'

# scutil
alias sys.get.computername='scutil --get ComputerName'
alias sys.get.localhostname='scutil --get LocalHostName'
alias sys.get.hostname='scutil --get HostName'
alias sys.get.dns='scutil --dns'
alias sys.get.proxy='scutil --proxy'
alias sys.get.network.interface='scutil --nwi'

alias sys.uti.file='mdls -name kMDItemContentTypeTree '

alias sys.pkg.list='pkgutil --pkgs'

# show CPU info
alias sys.cpu='sysctl -n machdep.cpu.brand_string'

alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'

# OS X's launchctl
alias launch.list='launchctl list '
alias launch.load='launchctl load '
alias launch.unload='launchctl unload '
alias launch.getenv='launchctl getenv '
alias launch.start='launchctl start '
alias launch.stop='launchctl stop '

# Spotlight / Meta-data indexing (MDS)
alias spotlight_off='sudo mdutil -a -i off'
alias spotlight_on='sudo mdutil -a -i on'

alias spotlight.exclusion.show='sudo defaults read /.Spotlight-V100/VolumeConfiguration.plist Exclusions'
alias spotlight.exclusion.add='sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add '

alias spotlight.indexing.stop='sudo launchctl stop com.apple.metadata.mds'
alias spotlight.indexing.start='sudo launchctl start com.apple.metadata.md'
alias spotlight.indexing.restart='spotlight.indexing.stop && spotlight.indexing.start'


