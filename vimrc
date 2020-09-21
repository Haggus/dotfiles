"============="
"vimrc v0.10.3"
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
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
map <leader>f :Files<CR>
map <leader>F :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Rg<CR>
