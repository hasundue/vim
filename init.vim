let $VIMHOME = expand('<sfile>:p:h')

"
" Basics {
"
if &compatible
  set nocompatible
endif

augroup Init
  autocmd!
augroup END

set background=dark

set number
set nowrap
set signcolumn=number

set expandtab
set tabstop=2
set shiftwidth=2

set mouse=a
set clipboard+=unnamedplus

" }


"
" Keymaps {
"
let mapleader = ' '
let maplocalleader = ' '

nnoremap <C-p> :cp<CR>
nnoremap <C-n> :cn<CR>

nnoremap giw *:vimgrep /<C-r>// **/*<CR>
autocmd QuickFixCmdPost *vimgrep* cwindow

" }


"
" Jetpack {
"
source $VIMHOME/jetpack.vim

" }
