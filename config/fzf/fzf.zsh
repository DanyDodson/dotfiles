#!/usr/bin/env zsh

fzf_default_opts() {

  # onedark
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

  # default options
  export FZF_DEFAULT_OPTS=" \
    --walker-skip=.git,node_modules,target,Library,Pictures,Documents,Movies,Music,.Trash \
    --bind 'ctrl-space:toggle' \
    --bind 'ctrl-o:toggle-preview' \
    --bind 'ctrl-s:toggle-sort' \
    --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)' \
    --bind 'ctrl-e:execute(codium {+})' \
    --bind 'ctrl-n:execute(nvim {+})' \
    --border=rounded\
    --layout=reverse \
    --no-info \
    --tmux center \
    --no-scrollbar \
    --highlight-line \
    --margin=0,0 \
    --padding=0,0 \
    --literal \
    --no-hscroll \
    --height=~60% \
    --prompt='> ' \
    --ellipsis=' ...' \
    --ansi"

  # set onedark colors
  export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS"" \
    --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"" \
    --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"" \
    --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"
}

# get completions
source /opt/homebrew/opt/fzf/shell/completion.zsh

# get key bindings
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# unset to avoid conflicts
unset FZF_DEFAULT_COMMAND

# export FZF_DEFAULT_COMMAND='fd -iLH -t file --exclude .git --exclude node_modules . /Users/$(whoami)/Projects'

fzf_default_opts

# search files
export FZF_CTRL_T_OPTS=" \
  --header='Fuzzy Directories...' \
  --walker=dir,hidden,follow \
  --preview 'tree -C {} | head -200' \
  --bind 'enter:execute(nvim {})+abort'"

# search directories
export FZF_ALT_C_OPTS=" \
  --header='Fuzzy Files...' \
  --walker=file \
  --preview 'bat -n --decorations=never --color=always {} 2>/dev/null' \
  --bind 'enter:execute(nvim {} +1)'"

# _fzf_compgen_path() {
#   fd --hidden --no-ignore-vcs --exclude .git . "$1"
# }

# # Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type=d --hidden --no-ignore-vcs --exclude .git . "$1"
# }

# function open_file_in_nvim() {
#   file="$(fd -iLH -t file --exclude .git --exclude node_modules . /Users/$(whoami)/Projects | fzf --preview "bat --tabs=4 --style=plain --wrap=never --theme=OneHalfDark --color=always --decorations=never {} 2>/dev/null")"
#   if [[ -n $file ]]; then
#     nvim "$file"
#   fi
# }

# zle -N fv
# bindkey '^O' open_file_in_nvim
