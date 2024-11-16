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

  export FZF_DEFAULT_OPTS="--no-info --prompt=' ' --height=75%"

  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"" \
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"" \
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"" \
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}

_gen_fzf_default_opts

export FZF_DEFAULT_COMMAND='fd --hidden --type=d --strip-cwd-prefix --exclude .git'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_ALT_C_COMMAND='fd --hidden --strip-cwd-prefix --exclude .git'

# export FZF_PREVIEW_OPTS='--preview "$DOTFILES/config/fzf/fzf-preview.sh {}" --bind "?:toggle-preview,ctrl-a:select-all,ctrl-d:preview-page-down,ctrl-u:preview-page-up" --preview-window wrap'
# export FZF_PREVIEW_COMMAND="bat --decorations=never --theme=OneHalfDark --color always {} 2>/dev/null"

export FZF_CTRL_T_OPTS=""
export FZF_ALT_C_OPTS="--preview 'bat --decorations=never --theme=OneHalfDark --color always {} 2>/dev/null'"

source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
source /opt/homebrew/opt/fzf/shell/completion.zsh

_fzf_compgen_path () {
  fd --hidden --no-ignore-vcs --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir () {
  fd --type=d --hidden --no-ignore-vcs --exclude .git . "$1"
}

# bindkey '^O' fzf-cd-widget

function fv() {
  file="$(fd -iLH -t file . . | fzf --preview "bat --decorations=never --theme=OneHalfDark --color always {} 2>/dev/null" --reverse)"
  if [ -z "$file" ]; then
    return 0
  fi
  nvim "$file"
}

zle -N fv
bindkey '^O' fv