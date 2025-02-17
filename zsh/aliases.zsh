#!/usr/bin/env zsh

alias o="open"
alias oo="open ."

alias cl="clear"
alias or="omz reload"
alias c="cl && or"

alias path="printf '%s\n' $path"
alias fpath="printf '%s\n' $fpath"

alias sudo="sudo "

alias rmds="find . -type f -name '*.DS_Store' -ls -delete"

alias yy="yazi"

alias cat="bat"
alias -g :b='-h 2>&1 | bat --language=help --style=plain'
alias -g :b='--help 2>&1 | bat --language=help --style=plain'

alias cc="codium"

alias v="nvim"
alias e="$EDITOR"
alias nv="NVIM_APPNAME=nvim-normal nvim"
alias nf="NVIM_APPNAME=nvim-fredrik nvim"
alias dotconf="cd $DOTFILES && nvim"
alias nvconf="cd $HOME/.config/nvim && nvim"

alias tn="tmux new"
alias tl="tmux ls"
alias ta="tmux attach"
alias tk="tmux kill-session"
alias td="tmux detach"
bindkey -s ^p "tms\n"
bindkey -s ^w "tmux new\n"

alias lsg-npm="npm ls -g --depth 0"
alias lsg-yarn="yarn global list"
alias lsg-pnpm="pnpm ls -g"

alias bbin="brew bundle install --file=~/.dotfiles/config/brew/brewfile"
alias bbcl="brew bundle cleanup --file=~/.dotfiles/config/brew/brewfile"
alias bbch="brew bundle check --file=~/.dotfiles/config/brew/brewfile"
alias bleaves="brew leaves | xargs brew desc --eval-all"
alias bleavesc="brew ls --casks | xargs brew desc --eval-all"

alias get="curl -O -L --silent"
alias wget="wget --no-check-certificate"

alias ls='/opt/homebrew/bin/gls --color=auto --human-readable --group-directories-first -I .DS_Store -I .Trash -I "Icon'$'\r"'
alias l="ls -gol"
alias ll="ls -AlgoL"
alias la="ls -Algo"

[ -d $HOME/Downloads ] && alias dl="cd $HOME/Downloads"
[ -d $HOME/.dotfiles ] && alias dots="cd $HOME/.dotfiles"
[ -d $HOME/Developer ] && alias dev="cd $HOME/Developer"
[ -d $HOME/Developer/data ] && alias data="cd $HOME/Developer/data"
[ -d $HOME/Developer/plugins ] && alias plugins="cd $HOME/Developer/plugins"
[ -d $HOME/Developer/practice ] && alias practice="cd $HOME/Developer/practice"
[ -d $HOME/Developer/courses ] && alias courses="cd $HOME/Developer/courses"
[ -d $HOME/Developer/repos ] && alias repos="cd $HOME/Developer/repos"
[ -d $HOME/Developer/served ] && alias served="cd $HOME/Developer/served"
[ -d $HOME/Developer/temp ] && alias temp="cd $HOME/Developer/temp"

# create and cd into directory
function mkd() {
  mkdir -p $@ && cd ${@:$#}
}

# canonical hex dump
alias hd="hexdump -C"

# macos has no md5sum, so use md5 as a fallback
alias md5sum="md5"

# macos has no sha1sum, so use shasum as a fallback
alias sha1sum="shasum"

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
