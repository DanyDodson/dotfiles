#!/usr/bin/env zsh

_gen_fzf_default_opts() {

  # OneDark
  local color00='#282c34'
  local color01='#353b45'
  local color02='#3e4451'
  local color03='#545862'
  local color04='#565c64'
  local color05='#abb2bf'
  local color06='#b6bdca'
  local color07='#c8ccd4'
  local color08='#e06c75'
  local color09='#d19a66'
  local color0A='#e5c07b'
  local color0B='#98c379'
  local color0C='#56b6c2'
  local color0D='#61afef'
  local color0E='#c678dd'
  local color0F='#be5046'

  export FZF_DEFAULT_OPTS="--no-info --prompt=' ' --height=50%"

  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"" \
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"" \
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"" \
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}

_gen_fzf_default_opts

export FZF_ALT_C_COMMAND="fd --type d -HLi . . 2>/dev/null"
export FZF_DEFAULT_COMMAND="rg --hidden -l "" -g '!.git' . 2>/dev/null"
export FZF_PREVIEW_COMMAND="bat --decorations=never --theme=OneHalfDark --color always {} 2>/dev/null"

source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh

_fzf_compgen_path() {
  fd -HLi . "$1" 2>/dev/null
}
_fzf_compgen_dir() {
  fd --type d -HLi . "$1" 2>/dev/null
}

bindkey '^O' fzf-cd-widget

function fvim() {
  file="$(fd -iLH -t file . . | fzf --reverse)"
  if [ -z "$file" ]; then
    return 0
  fi
  nvim "$file"
}

# faster to load projects before the script
# projects=$(find "$HOME/Projects" -name .git | sed -E 's/.*\/dev\/(.*)\/\.git/\1/')
# class=$(find "$HOME/Projects/class" -name .git | sed -E 's/.*\/dev\/(.*)\/\.git/\1/')
# exts=$(find "$HOME/Projects/exts" -name .git | sed -E 's/.*\/dev\/(.*)\/\.git/\1/')
# repos=$(find "$HOME/Projects/repos" -name .git | sed -E 's/.*\/dev\/(.*)\/\.git/\1/')
# served=$(find "$HOME/Projects/served" -name .git | sed -E 's/.*\/dev\/(.*)\/\.git/\1/')

# function projects() {
#   cd "$HOME/Projects/$(echo $projects | fzf)"
# }

# function class() {
#   cd "$HOME/Projects/class/$(echo $class | fzf)"
# }

# function exts() {
#   cd "$HOME/Projects/exts/$(echo $exts | fzf)"
# }

# function repos() {
#   cd "$HOME/Projects/repos/$(echo $repos | fzf)"
# }

# function served() {
#   cd "$HOME/Projects/served/$(echo $served | fzf)"
# }
