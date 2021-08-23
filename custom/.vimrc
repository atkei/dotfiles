" Set space to leader
nmap <SPACE> <Nop>
let mapleader=" "

" Set jj to escape
imap <silent> jj <ESC>

" Tab
nmap tn :tabnew<CR>
nmap th :tabfirst<CR>
nmap tk :tabnext<CR>
nmap tj :tabprev<CR>
nmap tl :tablast<CR>
nmap tt :tabedit<Space>
nmap tm :tabm<Space>
nmap td :tabclose<CR>

" Ignore wrap
nmap j gj
nmap k gk
nmap <Down> gj
nmap <Up> gk

" Yank to the end of current line
nmap Y y$

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set backspace=indent,eol,start
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set splitright
set splitbelow
set hidden
set hlsearch
set incsearch
set ignorecase
set smartcase
set nobackup
set noswapfile
set fileformats=unix,dos,mac
syntax on
set ruler
set number
set gcr=a:blinkon0
set scrolloff=3
set laststatus=2
set modeline
set modelines=10
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
set autoread
set noerrorbells visualbell t_vb=
set clipboard+=unnamed,autoselect
set mouse=a
set whichwrap=b,s,h,l,<,>,[,]
noremap <silent> <leader>n :nohlsearch<CR>
