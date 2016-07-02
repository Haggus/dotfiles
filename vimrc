"vimrc v0.1"

"Leader"
let mapleader=','

"General"
set timeoutlen=1000 ttimeoutlen=0

"Vundle"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'

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
