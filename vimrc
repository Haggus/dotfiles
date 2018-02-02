"============"
"vimrc v0.3.2"
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

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --rust-completer' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vimwiki/vimwiki'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-cursorword'
Plug 'itchyny/calendar.vim'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'gko/vim-coloresque'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'jtdowney/vimux-cargo'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vimoutliner/vimoutliner'
Plug 'tpope/vim-surround'
Plug 'sbdchd/neoformat'
Plug 'jreybert/vimagit'
Plug 'w0rp/ale'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
hi Normal ctermbg=none

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

"Better Line Wraps"
set wrap
set linebreak
set showbreak=¬

"======="
"PLUGINS"
"======="

"Vimwiki"
let g:vimwiki_hl_headers=1
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_folding='syntax'

"YouCompleteMe"
let g:ycm_rust_src_path  = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

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

"FZF"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right:50%'), <bang>0)
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
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
  \ 'header':  ['fg', 'Comment'] }

"Neoformat"
let g:neoformat_try_formatprg = 1
autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5

"========="
"KEYBINDINGS"
"========="

"Disable Arrows"
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

"NerdTree"
nnoremap <C-n> :NERDTreeToggle<cr>

"NerdCommenter"
map <C-i> <leader>c<space>

"Move between windows"
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Git"
map <leader>gf :Git! diff<CR>
map <leader>gt :Git! diff --staged<CR>

"Tabs"
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>
map <leader>tt :tabnew<CR>

"Searches"
map <leader>n :cnext<CR>
map <leader>N :cprev<CR>

"Calendar"
map <leader>ll :Calendar<CR>

"FZF"
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Ag<CR>
map <leader>gs :GFiles?<CR>
map <leader>gl :Commits<CR>

"YouCompleteMe"
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

"Vimux"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>

map <Leader>rr :wa<CR> :CargoRun<CR>
map <Leader>ra :wa<CR> :CargoTestAll<CR>
map <Leader>rt :wa<CR> :CargoUnitTestCurrentFile<CR>
map <Leader>rf :wa<CR> :CargoUnitTestFocused<CR>

"Neoformat"
map <Leader>m :Neoformat<CR>
