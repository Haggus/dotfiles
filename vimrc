"=========="
"vimrc v0.1.2"
"=========="

"Leader"
let mapleader=','

"General"
set modelines=0
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
set scrolloff=8
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set laststatus=2
set visualbell
set list listchars=tab:»·,trail:·

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'neomake/neomake'
Plug 'kchmck/vim-coffee-script'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

"Numbering"
set number
set relativenumber

"Tabs"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Search"
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Cursor"
set lazyredraw
set ruler
set matchtime=3

"Better Line Wraps"
set wrap
set linebreak
set showbreak=¬

"Disable Arrows"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"======="
"PLUGINS"
"======="

"CtrlP"
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip
nnoremap <C-b> :CtrlPBuffer<cr>

"NerdTree"
nnoremap <C-n> :NERDTreeToggle<cr>

"NerdCommenter"
map <C-i> <Leader>c<space>

"Rainbow Parentheses Improved
let g:rainbow_active=1

"Airline"
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=1
let g:airline_theme='gruvbox'

"Indent Guides"
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1

let g:indent_guides_auto_colors=0

"========="
"SHORTCUTS"
"========="

"Move between windows"
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <leader>ss :!npm run test<CR>
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>
map <leader>tt :tabnew<CR>
