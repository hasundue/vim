" 
" Install vim-jetpack if not exists {
"
let s:jetpackfile = expand('<sfile>:p:h') .. '/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"

if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

silent! packadd vim-jetpack

" }

"
" Plugins {
"
call jetpack#begin()

" Jetpack
call jetpack#add('tani/vim-jetpack', { 'opt': 1 })

" Appearance
call jetpack#add('sainnhe/gruvbox-material')
call jetpack#add('itchyny/lightline.vim')
call jetpack#add('mengelbrecht/lightline-bufferline')
call jetpack#add('vimpostor/vim-tpipeline')

" Editing
call jetpack#add('tpope/vim-commentary')
call jetpack#add('machakann/vim-sandwich')

" Copilot
call jetpack#add('github/copilot.vim')

" Denops
call jetpack#add('vim-denops/denops.vim')
call jetpack#add('lambdalisue/guise.vim')
call jetpack#add('lambdalisue/gin.vim')

" ddu.vim
call jetpack#add('Shougo/ddu.vim')
call jetpack#add('Shougo/ddu-commands.vim')

call jetpack#add('Shougo/ddu-ui-ff')
call jetpack#add('Shougo/ddu-ui-filer')

call jetpack#add('Shougo/ddu-kind-file')
call jetpack#add('Shougo/ddu-column-filename')

call jetpack#add('Shougo/ddu-source-file')
call jetpack#add('matsui54/ddu-source-file_external')
call jetpack#add('matsui54/ddu-source-help')
call jetpack#add('shun/ddu-source-rg')

Jetpack 'hasundue/ddu-filter-zf', { 'do': 'deno task build' }

" ddc.vim
call jetpack#add('Shougo/ddc.vim')

" Neovim
if has('nvim')
  call jetpack#add('nvim-lua/plenary.nvim')

  call jetpack#add('neovim/nvim-lspconfig')
  call jetpack#add('williamboman/mason.nvim')
  call jetpack#add('williamboman/mason-lspconfig')

  call jetpack#add('nvim-treesitter/nvim-treesitter')
  call jetpack#add('nvim-treesitter/nvim-treesitter-context')
  call jetpack#add('neovim/tree-sitter-vimdoc')
  call jetpack#add('yioneko/nvim-yati')
endif

call jetpack#end()

" }

"
" Configurations {
"

" Vim
for path in glob('$VIMHOME/plugin.d/*.vim', 1, 1, 1)
  execute printf('source %s', fnameescape(path))
endfor

" Neovim
for path in glob('$VIMHOME/plugin.d/*.lua', 1, 1, 1)
  execute printf('source %s', fnameescape(path))
endfor

" }
