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
endif

" Configurations
let g:dein#enable_notification = v:true
let g:dein#install_progress_type = "none"
let g:dein#install_message_type = "none"

" A directory for hooks
let s:dein_hooks_dir = expand('~/.config/vim/plugin.d')

" A wrapper function for dein#add() to find hooks files
function! s:add(repo, options = {}) abort
  let plugin = dein#parse#_dict(dein#parse#_init(a:repo, a:options))

  let plugin_name = fnamemodify(plugin.name, ':r')
  let filename = fnamemodify(s:dein_hooks_dir . '/' . plugin_name, ':p')

  let filepath = filereadable(filename . '.vim')
    \ ? filename . '.vim'
    \ : filereadable(filename . '.lua')
    \   ? filename . '.lua'
    \   : ''

  if filepath !=# ''
    let a:options.hooks_file = filepath
  endif

  call dein#add(a:repo, a:options)
endfunction

"
" Load plugins
"
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " dein.vim
  call dein#add('Shougo/dein.vim')

  " Appearance
  silent call s:add('sainnhe/gruvbox-material')
  call s:add('itchyny/lightline.vim')
  call s:add('mengelbrecht/lightline-bufferline', #{ 
    \   depends: 'lightline.vim',
    \   on_event: 'BufAdd',
    \   on_if: 'bufnr("$") > 1',
    \ })

  " UI
  call s:add('mattn/vim-notification', #{ 
    \   if: has('vim'),
    \   on_func: 'notification#show',
    \ })
  call s:add('rcarriga/nvim-notify', #{ 
    \   if: has('nvim'),
    \   on_lua: 'notify',
    \ })
  call s:add('lambdalisue/guise.vim', #{ 
    \   depends: 'denops.vim',
    \   on_event: 'TermOpen'
    \ })
  call s:add('vimpostor/vim-tpipeline')

  " Editing
  call s:add('tpope/vim-commentary', #{ on_event: 'CursorMoved' })
  call s:add('machakann/vim-sandwich', #{ on_event: 'CursorMoved' })

  " Git
  call s:add('tpope/vim-fugitive', #{ on_cmd: ['Git'] })
  call s:add('airblade/vim-gitgutter', #{ on_event: 'FileType' })

  " Copilot
  call s:add('github/copilot.vim', #{ on_event: 'InsertEnter' })

  " Denops
  call s:add('vim-denops/denops.vim', #{ 
    \   on_event: 'CursorHold'
    \ })
  call s:add('matsui54/denops-popup-preview.vim', #{
    \   depends: 'denops.vim',
    \   on_event: 'CompleteChanged',
    \ })  
  call s:add('matsui54/denops-signature_help', #{ 
    \   depends: 'denops.vim',
    \   on_event: 'InsertEnter',
    \ })
  call s:add('skanehira/denops-silicon.vim', #{
    \   depends: 'denops.vim',
    \   on_cmd: 'Silicon',
    \ })

  " ddu.vim
  call s:add('Shougo/ddu.vim', #{ 
    \   depends: 'denops.vim',
    \   on_source: 'denops.vim'
    \ })
  call s:add('Shougo/ddu-commands.vim', #{ 
    \   depends: 'ddu.vim',
    \   on_cmd: 'Ddu',
    \ })
  call s:add('hasundue/ddu-filter-zf', #{ 
    \   on_source: 'ddu.vim',
    \   build: 'deno task build',
    \ })
  call s:add('Shougo/ddu-ui-ff', #{ on_source: 'ddu.vim' })
  call s:add('~/ddu-ui-filer', #{ on_source: 'ddu.vim' })
  call s:add('Shougo/ddu-kind-file', #{ on_source: 'ddu.vim' })
  call s:add('Shougo/ddu-column-filename', #{ on_source: 'ddu.vim' })
  call s:add('Shougo/ddu-source-file', #{ on_source: 'ddu.vim' })
  call s:add('Shougo/ddu-filter-matcher_hidden', #{ on_source: 'ddu.vim' })
  call s:add('matsui54/ddu-source-file_external', #{ on_source: 'ddu.vim' })
  call s:add('matsui54/ddu-source-help', #{ on_source: 'ddu.vim' })
  call s:add('shun/ddu-source-rg', #{ on_source: 'ddu.vim' })

  " ddc.vim
  call s:add('Shougo/ddc.vim', #{
    \   depends: ['denops.vim', 'pum.vim'],
    \   on_event: ['InsertEnter', 'CmdlineEnter', 'CursorHold'],
    \ })
  call s:add('Shougo/pum.vim')
  call s:add('vim-skk/denops-skkeleton.vim', #{ 
    \   depends: 'denops.vim',
    \   on_source: 'ddc.vim'
    \ })
  call s:add('Shougo/ddc-ui-pum', #{ on_source: 'ddc.vim' })
  call s:add('Shougo/ddc-cmdline', #{ on_source: 'ddc.vim' })
  call s:add('Shougo/ddc-cmdline-history', #{ on_source: 'ddc.vim' })
  call s:add('Shougo/ddc-nvim-lsp', #{ on_source: 'ddc.vim', if: has('nvim') })
  call s:add('LumaKernel/ddc-file', #{ on_source: 'ddc.vim' })
  call s:add('tani/ddc-fuzzy', #{ on_source: 'ddc.vim' })

  " neovim
  call s:add('nvim-lua/plenary.nvim', #{ if: has('nvim') })

  " tree-sitter (neovim)
  call s:add('nvim-treesitter/nvim-treesitter', #{ 
    \   if: has('nvim'),
    \   merged: v:false,
    \   on_event: 'FileType',
    \ })
  call s:add('nvim-treesitter/nvim-treesitter-context', #{
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })
  call s:add('neovim/tree-sitter-vimdoc', #{ 
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })
  call s:add('yioneko/nvim-yati', #{ 
    \   if: has('nvim'),
    \   on_source: 'nvim-treesitter',
    \ })

  " nvim-lsp (neovim)
  call s:add('neovim/nvim-lspconfig', #{
    \   if: has('nvim'),
    \   on_event: 'FileType'
    \ })
  call s:add('williamboman/mason.nvim', #{
    \   if: has('nvim'),
    \   on_source: 'mason-lspconfig',
    \ })
  call s:add('williamboman/mason-lspconfig', #{
    \   if: has('nvim'),
    \   on_source: 'nvim-lspconfig',
    \ })
  call s:add('lvimuser/lsp-inlayhints.nvim', #{
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
