#!/usr/bin/env zsh

_exists() {
  command -v $1 >/dev/null 2>&1
}

alias o="open"
alias oo="open ."

alias cl="clear"
alias or="omz reload"
alias c="cl && or"

alias 644="chmod 644"
alias 755="chmod 755"
alias 777="chmod 777"

alias path="printf '%s\n' $path"
alias fpath="printf '%s\n' $fpath"

# enable aliases to be sudo’ed
alias sudo="sudo "

# clean up .DS_Store files
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

# go to folder
[ -d $HOME/Downloads ] && alias dl="cd $HOME/Downloads"
[ -d $HOME/.dotfiles ] && alias dots="cd $HOME/.dotfiles"
[ -d $HOME/Developer ] && alias dev="cd $HOME/Developer"
[ -d $HOME/Developer/data ] && alias data="cd $HOME/Developer/data"
[ -d $HOME/Developer/plugins ] && alias plugins="cd $HOME/Developer/plugins"
[ -d $HOME/Developer/courses ] && alias courses="cd $HOME/Developer/courses"
[ -d $HOME/Developer/repos ] && alias repos="cd $HOME/Developer/repos"
[ -d $HOME/Developer/served ] && alias served="cd $HOME/Developer/served"
[ -d $HOME/Developer/temp ] && alias temp="cd $HOME/Developer/temp"

if _exists codium; then
  alias cc="codium"
fi

if _exists npm; then
  alias lsg-npm="npm ls -g --depth 0"
fi

if _exists yarn; then
  alias lsg-yarn="yarn global list"
fi

if _exists pnpm; then
  alias lsg-pnpm="pnpm ls -g"
fi

if _exists yazi; then
  alias yy="yazi"
fi

if _exists ranger; then
  alias rr="ranger"
fi

if _exists bat; then
  alias cat="bat"
  alias -g :b='-h 2>&1 | bat --language=help --style=plain'
  alias -g :b='--help 2>&1 | bat --language=help --style=plain'
fi

if _exists git; then
  alias ga="git add ."
  alias gc="git commit -m"
  alias gp="git push -u origin main"
  alias gs="git status"
fi

if _exists nvim; then
  alias v="nvim"
  alias e="$EDITOR"
  alias nv-normal="NVIM_APPNAME=nvim-normal/ nvim"
  alias nv-astro="NVIM_APPNAME=nvim-astro/ nvim"
  alias nv-lunar="NVIM_APPNAME=nvim-lunar/ nvim"
  alias dotconf="cd $DOTFILES && nvim"
  alias nvconf="cd $HOME/.config/nvim && nvim"
fi

if _exists tmux; then
  alias tn="tmux new"
  alias tl="tmux ls"
  alias tk="tmux kill-session"
  alias td="tmux detach"
  bindkey -s ^F "tms\n"
  bindkey -s ^w "tmux new\n"
fi

if _exists brew; then
  alias bbin="brew bundle install --file=~/.dotfiles/config/brew/brewfile"
  alias bbcl="brew bundle cleanup --file=~/.dotfiles/config/brew/brewfile"
  alias bbch="brew bundle check --file=~/.dotfiles/config/brew/brewfile"
  alias bleaves="brew leaves | xargs brew desc --eval-all"
  alias bleavesc="brew ls --casks | xargs brew desc --eval-all"
fi

if _exists wget; then
  alias wget="wget --no-check-certificate"
fi

if _exists curl; then
  alias get="curl -O -L --silent"
fi

if _exists "/opt/homebrew/bin/gls"; then
  alias ls='/opt/homebrew/bin/gls --color=auto --human-readable --group-directories-first -I .DS_Store -I .Trash -I "Icon'$'\r"'
  alias l="ls -Algoh"
  alias ll="ls -A"
  alias la="ls -Al"
fi

if _exists "/opt/homebrew/bin/transmission-remote"; then
  alias tran='transmission-remote'
  alias trand='transmission-daemon --dump-settings'
fi

# create and cd into directory
function mkd() {
  mkdir -p $@ && cd ${@:$#}
}

# canonical hex dump
if _exists hd; then
  alias hd="hexdump -C"
fi

# macos has no md5sum, so use md5 as a fallback
if _exists md5sum; then
  alias md5sum="md5"
fi

# macos has no sha1sum, so use shasum as a fallback
if _exists sha1sum; then
  alias sha1sum="shasum"
fi

# js core repl
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Helpers/jsc"
[ -e "${jscbin}" ] && alias jsc="${jscbin}"
unset jscbin

# launch macos apps
alias ios="open -a Simulator.app"
alias xcode="open -a Xcode.app"
alias mon_icloud="brctl monitor com.apple.CloudDocs | grep %"
alias chrome-dev="open -a 'Brave Browser' --args --remote-debugging-port=9229"

# scutil shortcuts
alias sc_computername="scutil --get ComputerName"
alias sc_localhostname="scutil --get LocalHostName"
alias sc_hostname="scutil --get HostName"
alias sc_dns="scutil --dns"
alias sc_proxy="scutil --proxy"
alias sc_net_info="scutil --nwi"

# sysctl shortcuts
alias sys_cpu="sysctl -n machdep.cpu.brand_string"

# osx"s launchctl
alias launch_list="launchctl list "
alias launch_load="launchctl load "
alias launch_unload="launchctl unload "
alias launch_getenv="launchctl getenv "
alias launch_start="launchctl start "
alias launch_stop="launchctl stop "

# list installed packages
alias sys_pkg_list="pkgutil --pkgs"

# osx"s launch services
alias lsregister="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister"

# get kMDItemContentTypeTree metadata for file
alias sys_uti_file="mdls -name kMDItemContentTypeTree "

# spotlight on/off
alias spotlight_off="sudo mdutil -a -i off"
alias spotlight_on="sudo mdutil -a -i on"
