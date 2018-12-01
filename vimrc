"============"
"vimrc v0.5.2"
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

"vim-plug"
filetype off
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --ts-completer --rust-completer --clang-completer --system-libclang' }
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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()
filetype plugin indent on

"Colors & Themes"
syntax enable
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
hi Normal ctermbg=none
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

"YouCompleteMe"
let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"FZF"
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

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

"UltiSnips"
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

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
map <leader>gf :Git! diff<CR>
map <leader>gt :Git! diff --staged<CR>
map <leader>gb :Gblame<CR>
map <leader>gs :GFiles?<CR>
map <leader>gc :BCommits<CR>
map <leader>gl :Commits!<CR>

"Tabs"
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>
map <leader>tt :tabnew<CR>
map <leader>tc :tabclose<CR>

"Searches"
map <leader>n :cnext<CR>
map <leader>N :cprev<CR>

"FZF"
map <leader>f :GFiles<CR>
map <leader>F :Files<CR>
map <leader>l :BLines<CR>
map <leader>L :Lines<CR>
map <leader>c :Commands<CR>
map <leader>b :Buffers<CR>
map <leader>/ :Ag<CR>

"YouCompleteMe"
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

"Vimux"
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vz :VimuxZoomRunner<CR>
