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

filetype off
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

syntax enable

map <leader>f :Files<CR>
map <leader>F :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Rg<CR>
