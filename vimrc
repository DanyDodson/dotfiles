
set viminfo+=n~/.config/vim/viminfo

let mapleader =" "

set term=xterm-256color
filetype plugin indent on

syntax on

set history=1000

set termguicolors

set nobackup
set autoread
set relativenumber

set tabstop=2
set shiftwidth=2
set smartindent
set expandtab

set hlsearch
set incsearch
set ignorecase

set statusline=
set statusline+=\ %F\ %M\ %Y\ %R
set statusline+=%=
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=1
