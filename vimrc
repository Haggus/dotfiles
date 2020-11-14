"============="
"vimrc v0.11.0"
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

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
colorscheme gruvbox

"Quickly clear selection highlight"
nmap <Esc><Esc> :noh<CR>

"Move between windows"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"FZF"
map <leader>f :GFiles<CR>
map <leader>F :Files<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Rg<CR>
