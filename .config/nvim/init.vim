source ~/.keymaps.vim

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

let s:dein_dir = expand('$HOME/.cache/dein')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
  " Let dein manage dein
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

  let s:toml_dir  = expand('$HOME/.config/nvim/dein')
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazy_toml = s:toml_dir . '/dein_lazy.toml' 

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set binary

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set number

syntax on

" pyenv
let g:python3_host_prog = $PYENV_ROOT.'/shims/python'

augroup vimrc 
  autocmd!
augroup END
