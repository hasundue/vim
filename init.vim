let $VIMHOME = expand("~/.config/vim")

"
" Startup {
"
if has('vim_starting')
  set encoding=utf-8
  scriptencoding utf-8

  " Disable unnecessary default plugins
  let g:loaded_gzip              = 1
  let g:loaded_tar               = 1
  let g:loaded_tarPlugin         = 1
  let g:loaded_zip               = 1
  let g:loaded_zipPlugin         = 1
  let g:loaded_rrhelper          = 1
  let g:loaded_2html_plugin      = 1
  let g:loaded_vimball           = 1
  let g:loaded_vimballPlugin     = 1
  let g:loaded_getscript         = 1
  let g:loaded_getscriptPlugin   = 1
  let g:loaded_logipat           = 1
  let g:loaded_matchparen        = 1
  let g:loaded_man               = 1
  let g:loaded_netrw             = 1
  let g:loaded_netrwPlugin       = 1
  let g:loaded_netrwSettings     = 1
  let g:loaded_netrwFileHandlers = 1
endif

" }

"
" Interface {
"
set number          " show line numbers
set numberwidth=2   " set width of line number column
set signcolumn=yes  " always shows signcolumn

set noshowcmd       " do not display incomplete commands on the last line
set noshowmode      " do not display mode on the last line

set laststatus=2    " always shows statusline
set showtabline=2   " always shows tabline

set nowrap          " do not wrap lines
set breakindent     " every wrapped line will continue visually indented

set mouse=a
set clipboard+=unnamedplus

" }

"
" Language {
"
set helplang=en,ja " prefer English help

" set default language for spell check
set nospell
set spelllang=en_us,cjk
set fileencodings=ucs-bom,utf-8

" }

"
" Keymaps {
"
let mapleader = ' '
let maplocalleader = ' '

nnoremap <C-p> :cp<CR>
nnoremap <C-n> :cn<CR>

" Grep with current word under cursor and show results in quickfix window
nnoremap giw *:vimgrep /<C-r>// **/*<CR>
autocmd QuickFixCmdPost *vimgrep* cwindow

" }

"
" Editing {
"
set noswapfile      " do not create swap files
set smarttab        " insert blanks according to shiftwidth
set expandtab       " use spaces instead of TAB
set shiftround      " round indent to multiple of shiftwidth with > and <
set textwidth=0     " do not automatically wrap text

set autoindent      " copy indent from current line when starting a new line
set copyindent      " copy the structure of the existing lines indent when
                    " autoindenting a new line
set preserveindent  " Use :retab to clean up whitespace

" }

"
" Plugins {
"
source $VIMHOME/dein.vim

" }
