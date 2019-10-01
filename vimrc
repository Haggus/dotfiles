"============"
"vimrc v0.6.6"
"============"

"Leader"
let mapleader=','

"General"
set modelines=0
set timeoutlen=1000 ttimeoutlen=0
set encoding=utf-8
set scrolloff=8
set hidden
set wildmode=list:longest
set laststatus=2
set visualbell
set listchars=tab:»·,trail:·,extends:>,precedes:<
set list
set backupcopy=yes
set undofile
set undodir=~/.vim/undodir
set clipboard+=unnamedplus

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --rust-completer --clangd-completer' }
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-cursorword'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
colorscheme gruvbox
hi CursorLine ctermbg=236

"Tabs"
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Search"
set ignorecase
set smartcase
set gdefault
set inccommand=split
set showmatch

"Cursor"
set lazyredraw
set matchtime=3
set cursorline

"Better Line Wraps"
set linebreak
set showbreak=¬

"======="
"PLUGINS"
"======="

"FZF"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

"Use colorscheme colors for FZF"
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'],
\}

"ALE"
let g:ale_linters = {
\ 'javascriptreact': ['eslint'],
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier'],
\ 'css': ['prettier'],
\ 'rust': ['rustfmt'],
\}

"========="
"KEYBINDINGS"
"========="

"Quickly clear selection highlight"
nmap <Esc><Esc> :noh<CR>

"NerdTree"
nnoremap <C-n> :NERDTreeToggle<cr>

"Move between windows"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Git"
map <leader>gb :Gblame<CR>
map <leader>gs :Gstatus<CR>
map <leader>gc :BCommits<CR>
map <leader>gl :Commits!<CR>

"Searches"
map <leader>n :cnext<CR>
map <leader>N :cprev<CR>

"FZF"
map <leader>f :Files<CR>
map <leader>F :GFiles<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Ag<CR>

"ALE"
map <leader>x :ALEFix<CR>
