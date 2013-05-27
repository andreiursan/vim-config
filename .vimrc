execute pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noimdisable
set iminsert=0
set imsearch=0
set noswapfile
set hlsearch
set incsearch
set number
set backspace=2
set hidden
set list

autocmd vimenter * if !argc() | NERDTree | endif
colorscheme vividchalk 

