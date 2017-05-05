"============"
"vimrc v0.2.0"
"============"

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
set listchars=eol:¬,tab:»·,trail:·,extends:>,precedes:<
set list
set backupcopy=yes

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --racer-completer' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jtdowney/vimux-cargo'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
hi Normal ctermbg=none

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

"Neomake"
autocmd! BufWritePost,BufEnter * Neomake
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let g:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

"Vimwiki"
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_folding='syntax'

"YouCompleteMe"
let g:ycm_rust_src_path  = '/home/zunimassa/src/rust/src'

"Calendar"
let g:calendar_google_calendar=1
let g:calendar_google_task=1

"Lightline"
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
  \ }

"Colorizer"
let g:colorizer_auto_filetype='css,html'

"Ack"
map <leader>s :Ack 
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"Vimux"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>

map <Leader>rr :wa<CR> :CargoRun<CR>
map <Leader>ra :wa<CR> :CargoTestAll<CR>
map <Leader>rt :wa<CR> :CargoUnitTestCurrentFile<CR>
map <Leader>rf :wa<CR> :CargoUnitTestFocused<CR>

"========="
"SHORTCUTS"
"========="

"Quickly exit terminal
tnoremap <Esc> <C-\><C-n>

"Move between windows"
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Git"
map <leader>gg :Gstatus<CR>
map <leader>gf :Git! diff<CR>
map <leader>gs :Git! diff --staged<CR>
map <leader>gc :Gcommit<CR>

"Tabs"
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>
map <leader>tt :tabnew<CR>

"Searches"
map <leader>n :cnext<CR>
map <leader>N :cprev<CR>

"Calendar"
map <leader>ll :Calendar<CR>
