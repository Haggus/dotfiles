set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

set number
syntax enable
set background=dark
colorscheme gruvbox

set timeoutlen=1000 ttimeoutlen=0
