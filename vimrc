"============"
"vimrc v0.6.0"
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
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --rust-completer' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-cursorword'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

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
set incsearch
set inccommand=split
set showmatch
set hlsearch
set magic

"Cursor"
set lazyredraw
set ruler
set matchtime=3
set cursorline

"Better Line Wraps"
set wrap
set linebreak
set showbreak=¬

"======="
"PLUGINS"
"======="

"FZF"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

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
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['prettier'],
\ 'css': ['prettier'],
\ 'rust': ['rustfmt'],
\}

"LanguageClient"
let g:LanguageClient_serverCommands = {
\ 'rust':           ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
\ 'javascript':     ['javascript-typescript-stdio'],
\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
\}

"========="
"KEYBINDINGS"
"========="

"Disable Arrows"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

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

"LanguageClient"
nnoremap <leader>gg :call LanguageClient#textDocument_hover()<CR>
nnoremap <leader>gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>gr :call LanguageClient#textDocument_rename()<CR>

"Vimux"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

"ALE"
map <Leader>x :ALEFix<CR>
