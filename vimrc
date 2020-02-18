"============"
"vimrc v0.7.0"
"============"

"Leader"
let mapleader=','

"General"
set listchars=tab:»·,trail:·,extends:>,precedes:<
set list
set undofile
set undodir=~/.vim/undodir
set clipboard+=unnamedplus
set hidden

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
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
\ 'javascript': ['eslint'],
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
map <leader>/ :Rg<CR>

"ALE"
map <leader>x :ALEFix<CR>
