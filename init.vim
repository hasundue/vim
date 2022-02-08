"
" Basics {
"
if &compatible
    set nocompatible
endif

augroup Init
    autocmd!
augroup END

set number
set nowrap

set expandtab
set tabstop=2
set shiftwidth=2

set clipboard+=unnamedplus

set termguicolors
set pumblend=30
set winblend=30

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
" Terminal {
"
set sh=bash

tnoremap <Esc> <C-\><C-n>

autocmd TermOpen * setlocal nonumber norelativenumber
" autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" autocmd BufEnter * if &buftype ==# 'terminal' | startinsert | endif

" }


"
" dein {
"

" Directories
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/.config/nvim/dein')

" Install dein if not
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath+=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Options
let g:dein#install_check_diff  = v:false

" Setting up dein
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    " Let dein manage dein
    call dein#add(s:dein_dir)

    " List of plugin toml files
    let tomls = glob(s:toml_dir . "/*.toml")

    " Load each plugin
    for toml in split(tomls, "\n")
        call dein#load_toml(toml, {})
    endfor

    call dein#end()
    call dein#save_state()
endif

" Install plugins if not
if dein#check_install()
    call dein#install()
    call dein#recache_runtimepath()
endif

" Uninstall unused plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif

" Required
filetype plugin indent on
syntax on

" GitHub personal access token for check_update()
runtime token.vim

" Keymap
nnoremap <leader>dr :call dein#recache_runtimepath()<CR>
nnoremap <leader>du :call dein#check_update(v:true)<CR>

" }
