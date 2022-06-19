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

set expandtab
set tabstop=2
set shiftwidth=2

set updatetime=1000

set mouse=a

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
" dein {
"

" Directories
if has('nvim')
  let s:dein_dir = expand('~/.cache/dein')
else
  let s:dein_dir = expand('~/.vim/bundles')
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml_dir = expand('~/.config/vim/dein')
let s:toml_dir_vim = expand('~/.config/vim/dein/vim')
let s:toml_dir_nvim = expand('~/.config/vim/dein/nvim')

" Install dein if not
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Options
let g:dein#install_check_diff = v:true

" Setting up dein
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  call dein#add(s:dein_dir)

  " List of plugin toml files
  let tomls = glob(s:toml_dir . "/*.toml")
  if has('nvim')
    let tomls .= "\n" . glob(s:toml_dir_nvim . "/*.toml")
  else
    let tomls .= "\n" . glob(s:toml_dir_vim . "/*.toml")
  endif

  " Load each plugin
  for toml in split(tomls, "\n")
    call dein#load_toml(toml, {})
  endfor

  call dein#end()
  call dein#save_state()
endif

" Uninstall unused plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
endif

" Required
filetype plugin indent on
syntax on

" GitHub personal access token for check_update()
if has('nvim')
  runtime token.vim
else
  runtime config/token.vim
endif

" Keymap
nnoremap <leader>dr :call dein#recache_runtimepath()<CR>
nnoremap <leader>du :call dein#check_update(v:true)<CR>
nnoremap <leader>di :call dein#install()<CR>

" }


"
" NeoVim {
"
if has('nvim')
  runtime init.nvim.lua
endif

" }
