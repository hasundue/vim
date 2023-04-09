" Cache directory
if has('nvim')
  let s:dein_dir = expand('~/.cache/dein/nvim')
else
  let s:dein_dir = expand('~/.cache/dein/vim')
endif

" Repository cache
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_mod_repo_dir = s:dein_dir . '/repos/github.com/hasundue/dein-mod'

" Install dein if not exists
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')

  " Install dein-mod
  if !isdirectory(s:dein_mod_repo_dir)
    execute '!git clone https://github.com/hasundue/dein-mod' s:dein_mod_repo_dir
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_mod_repo_dir, ':p')
endif

" Plugin directory (read by dein#mod#add)
let g:dein#mod#hook_dir = expand('~/.config/vim/plugin.d')

" Configurations
let g:dein#enable_notification = v:true

"
" Load plugins
"
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.vim
  call dein#add('Shougo/dein.vim')

  " dein-mod
  call dein#add('hasundue/dein-mod')

  " Appearance
  call dein#mod#add('sainnhe/gruvbox-material')
  call dein#mod#add('itchyny/lightline.vim')
  call dein#mod#add('vimpostor/vim-tpipeline')
  call dein#mod#add('mengelbrecht/lightline-bufferline', #{ 
    \   depends: 'lightline.vim',
    \   on_event: 'BufAdd',
    \   on_if: 'bufnr("$") > 1',
    \ })

  " UI
  call dein#mod#add('mattn/vim-notification', #{ 
    \   if: has('vim'),
    \   on_source: 'denops.vim',
    \ })
  call dein#mod#add('rcarriga/nvim-notify', #{ 
    \   if: has('nvim'),
    \   on_source: 'denops.vim',
    \ })
  call dein#mod#add('lambdalisue/guise.vim', #{ on_event: 'TermOpen' })

  " Editing
  call dein#mod#add('tpope/vim-commentary', #{ on_event: 'CursorMoved' })
  call dein#mod#add('machakann/vim-sandwich', #{ on_event: 'CursorMoved' })

  " Git
  call dein#mod#add('tpope/vim-fugitive', #{ on_cmd: ['Git'] })
  call dein#mod#add('airblade/vim-gitgutter', #{ on_event: 'FileType' })

  " Copilot
  call dein#mod#add('github/copilot.vim', #{ on_event: 'InsertEnter' })

  " Denops
  call dein#mod#add('vim-denops/denops.vim', #{ 
    \   on_event: 'CursorHold'
    \ })
  call dein#mod#add('matsui54/denops-popup-preview.vim', #{
    \   depends: 'denops.vim',
    \   on_event: 'CompleteChanged',
    \ })  
  call dein#mod#add('matsui54/denops-signature_help', #{ 
    \   depends: 'denops.vim',
    \   on_event: 'InsertEnter',
    \ })

  " ddu.vim
  call dein#mod#add('Shougo/ddu.vim', #{ 
    \   depends: 'denops.vim',
    \   on_source: 'denops.vim'
    \ })
  call dein#mod#add('Shougo/ddu-commands.vim', #{ 
    \   depends: 'ddu.vim',
    \   on_cmd: 'Ddu',
    \ })
  call dein#mod#add('hasundue/ddu-filter-zf', #{ 
    \   on_source: 'ddu.vim',
    \   build: 'deno task build',
    \ })
  call dein#mod#add('Shougo/ddu-ui-ff', #{ on_source: 'ddu.vim' })
  call dein#mod#add('Shougo/ddu-ui-filer', #{ on_source: 'ddu.vim' })
  call dein#mod#add('Shougo/ddu-kind-file', #{ on_source: 'ddu.vim' })
  call dein#mod#add('Shougo/ddu-column-filename', #{ on_source: 'ddu.vim' })
  call dein#mod#add('Shougo/ddu-source-file', #{ on_source: 'ddu.vim' })
  call dein#mod#add('matsui54/ddu-source-file_external', #{ on_source: 'ddu.vim' })
  call dein#mod#add('matsui54/ddu-source-help', #{ on_source: 'ddu.vim' })
  call dein#mod#add('shun/ddu-source-rg', #{ on_source: 'ddu.vim' })

  " ddc.vim
  call dein#mod#add('Shougo/ddc.vim', #{
    \   depends: ['denops.vim', 'pum.vim'],
    \   on_event: ['InsertEnter', 'CmdlineEnter', 'CursorHold'],
    \ })
  call dein#mod#add('Shougo/pum.vim')
  call dein#mod#add('vim-skk/denops-skkeleton.vim', #{ 
    \   depends: 'denops.vim',
    \   on_source: 'ddc.vim'
    \ })
  call dein#mod#add('Shougo/ddc-ui-pum', #{ on_source: 'ddc.vim' })
  call dein#mod#add('Shougo/ddc-cmdline', #{ on_source: 'ddc.vim' })
  call dein#mod#add('Shougo/ddc-cmdline-history', #{ on_source: 'ddc.vim' })
  call dein#mod#add('Shougo/ddc-nvim-lsp', #{ on_source: 'ddc.vim', if: has('nvim') })
  call dein#mod#add('LumaKernel/ddc-file', #{ on_source: 'ddc.vim' })
  call dein#mod#add('tani/ddc-fuzzy', #{ on_source: 'ddc.vim' })

  " neovim
  call dein#mod#add('nvim-lua/plenary.nvim', #{ if: has('nvim') })

  " tree-sitter (neovim)
  call dein#mod#add('nvim-treesitter/nvim-treesitter', #{ 
    \   if: has('nvim'),
    \   merged: v:false,
    \   on_event: 'FileType',
    \ })
  call dein#mod#add('nvim-treesitter/nvim-treesitter-context', #{
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })
  call dein#mod#add('neovim/tree-sitter-vimdoc', #{ 
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })
  call dein#mod#add('yioneko/nvim-yati', #{ 
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })

  " nvim-lsp (neovim)
  call dein#mod#add('neovim/nvim-lspconfig', #{
    \   if: has('nvim'),
    \   on_event: 'FileType'
    \ })
  call dein#mod#add('williamboman/mason.nvim', #{
    \   if: has('nvim'),
    \   on_source: 'mason-lspconfig',
    \ })
  call dein#mod#add('williamboman/mason-lspconfig', #{
    \   if: has('nvim'),
    \   on_source: 'nvim-lspconfig',
    \ })
  call dein#mod#add('lvimuser/lsp-inlayhints.nvim', #{
    \   if: has('nvim'),
    \   on_source: 'nvim-lspconfig',
    \ })

  call dein#end()
  call dein#save_state()
endif

" Uninstall unused plugins
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
endif

" Install plugins if not installed
if dein#check_install()
 call dein#install()
endif

" Required for tree-sitter
if has('nvim')
  filetype plugin indent on
endif

" Keymap
nnoremap <leader>pr :call dein#recache_runtimepath()<CR>
nnoremap <leader>pi :call dein#install()<CR>
nnoremap <leader>pu :call dein#update()<CR>
