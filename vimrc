"============="
"vimrc v0.10.2"
"============="

let mapleader=','

set undofile
set undodir=~/.vim/undodir
set clipboard+=unnamedplus
set hidden
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

"Tabs"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Cursor"
set lazyredraw
set matchtime=3

"Better Line Wraps"
set linebreak
set showbreak=¬

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
