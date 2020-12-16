"============="
"vimrc v0.12.0"
"============="

let mapleader=','

set hidden
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set undofile
set undodir=~/.vim/undodir
set clipboard+=unnamedplus
set inccommand=split

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

syntax enable

"Quickly clear selection highlight"
nmap <Esc><Esc> :noh<CR>

"FZF"
map <leader>f :GFiles<CR>
map <leader>F :Files<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Rg<CR>
