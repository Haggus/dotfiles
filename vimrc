"=========="
"vimrc v0.1"
"=========="

"Leader"
let mapleader=','

"General"
set modelines=0
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
set scrolloff=8

"Vundle"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
set background=dark
colorscheme gruvbox

"Numbering"
set number
set relativenumber

"Tabs"
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"Search"
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"======="
"PLUGINS"
"======="

"CtrlP"
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
nnoremap <C-b> :CtrlPBuffer<cr>

"NerdTree"
nnoremap <C-n> :NERDTreeToggle<cr>

"========="
"SHORTCUTS"
"========="

"Mocha bind"
nnoremap <C-m> :!mocha<cr>
