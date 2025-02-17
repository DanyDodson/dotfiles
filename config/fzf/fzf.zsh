#!/usr/bin/env zsh

# get completions and keybindings
source /opt/homebrew/opt/fzf/shell/completion.zsh
source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

# search directories
export FZF_CTRL_T_OPTS=" \
  --header='Find Directories...' \
  --walker=dir,hidden,follow \
  --preview 'tree -C {} | head -200' \
  --bind 'enter:execute(nvim {})+abort'"

# search files
export FZF_ALT_C_OPTS=" \
  --header='Find Files...' \
  --walker=file \
  --preview 'bat -n --decorations=never --color=always {} 2>/dev/null' \
  --bind 'enter:execute(nvim {} +1)'"

export FZF_DEFAULT_OPTS=" \
  --walker-skip=.git,node_modules,target,Library,Pictures,Documents,Movies,Music,.Trash \
  --bind 'ctrl-space:toggle' \
  --bind 'ctrl-o:toggle-preview' \
  --bind 'ctrl-s:toggle-sort' \
  --bind 'ctrl-y:execute-silent(echo {+} | pbcopy)' \
  --bind 'ctrl-e:execute(codium {+})' \
  --bind 'ctrl-n:execute(nvim {+})' \
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
