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
let g:dein#types#git#enable_partial_clone = v:true

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
  call s:add('sainnhe/gruvbox-material')

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
  call s:add('psliwka/vim-dirtytalk', #{ on_ft: 'markdown' })

  " Git
  " call s:add('tpope/vim-fugitive', #{ on_cmd: ['Git'] })
  " call s:add('airblade/vim-gitgutter', #{ on_event: 'FileType' })

  " AI
  call s:add('github/copilot.vim', #{ on_event: 'InsertEnter' })
  " call s:add('tani/hey.vim', #{ on_event: 'InsertEnter' })

  " Denops
  call s:add('vim-denops/denops.vim')

  function! s:add_denops(repo, options = {}) abort
    call s:add(a:repo, extend(a:options, #{ depends: 'denops.vim' }))
  endfunction

  call s:add_denops('lambdalisue/deno-cache.vim', #{
    \   on_ft: 'typescript',
    \ })
  call s:add_denops('lambdalisue/gin.vim', #{
    \   on_source: 'ddu.vim',
    \ })

  " ddu.vim
  call s:add_denops('Shougo/ddu.vim', #{ 
    \   on_source: 'denops.vim'
    \ })

  function! s:add_ddu(repo, options = {}) abort
    call s:add(a:repo, extend(a:options, #{ on_source: 'ddu.vim' }))
  endfunction

  call s:add('Shougo/ddu-commands.vim', #{ 
    \   depends: 'ddu.vim',
    \   on_cmd: 'Ddu',
    \ })
  call s:add_ddu('hasundue/ddu-filter-zf', #{ 
    \   build: 'deno task build',
    \ })
  call s:add_ddu('Shougo/ddu-ui-ff')
  call s:add_ddu('Shougo/ddu-ui-filer')
  call s:add_ddu('Shougo/ddu-kind-file')
  call s:add_ddu('Shougo/ddu-column-filename')
  call s:add_ddu('Shougo/ddu-source-file')
  call s:add_ddu('Shougo/ddu-filter-matcher_hidden')
  call s:add_ddu('matsui54/ddu-source-file_external')
  call s:add_ddu('matsui54/ddu-source-help')
  call s:add_ddu('shun/ddu-source-rg')
  call s:add_ddu('shun/ddu-source-buffer')
  call s:add_ddu('kuuote/ddu-source-git_status')
  call s:add_ddu('kuuote/ddu-source-mr', #{ depends: 'mr.vim' })
  call s:add('lambdalisue/mr.vim', #{ on_source: 'ddu-source-mr' })

  " ddc.vim
  function! s:add_ddc(repo, options = {}) abort
    call s:add(a:repo, extend(a:options, #{ on_source: 'ddu.vim' }))
  endfunction
  call s:add('Shougo/ddc.vim', #{
    \   depends: ['denops.vim', 'pum.vim'],
    \   on_event: ['InsertEnter', 'CmdlineEnter'],
    \ })
  call s:add('Shougo/pum.vim')
  call s:add_ddc('vim-skk/denops-skkeleton.vim')
  call s:add_ddc('Shougo/ddc-ui-pum')
  call s:add_ddc('Shougo/ddc-cmdline')
  call s:add_ddc('Shougo/ddc-cmdline-history')
  call s:add_ddc('Shougo/ddc-nvim-lsp', #{ if: has('nvim') })
  call s:add_ddc('LumaKernel/ddc-file')
  call s:add_ddc('tani/ddc-fuzzy')
  call s:add_ddc('gamoutatsumi/ddc-emoji')

  " Neovim
  if has('nvim')
    call s:add('nvim-lua/plenary.nvim')
    call s:add('iamcco/markdown-preview.nvim', #{
      \   on_ft: ['markdown', 'pandoc.markdown', 'rmd'],
		  \   build: 'sh -c "cd app && yarn install"' 
	    \ })
    call s:add('williamboman/mason.nvim', #{
      \   on_source: ['mason-lspconfig', 'mason-nvim-lint'],
      \ })

    " tree-sitter
    call s:add('nvim-treesitter/nvim-treesitter', #{ 
      \   merged: v:false,
      \   on_event: 'FileType',
      \ })
    call s:add('nvim-treesitter/nvim-treesitter-context', #{
      \   on_source: 'nvim-treesitter',
      \ })
    call s:add('neovim/tree-sitter-vimdoc', #{ 
      \   on_source: 'nvim-treesitter',
      \ })

    " nvim-lsp
    call s:add('neovim/nvim-lspconfig', #{
      \   on_event: 'FileType'
      \ })
    call s:add('williamboman/mason-lspconfig', #{
      \   on_source: 'nvim-lspconfig',
      \ })
    call s:add('ray-x/lsp_signature.nvim', #{
      \   on_source: 'nvim-lspconfig',
      \ })

    " nvim-lint
    call s:add('mfussenegger/nvim-lint', #{
      \   on_event: 'FileType',
      \ })
    call s:add('rshkarin/mason-nvim-lint', #{
      \   on_source: 'nvim-lint',
      \ })
  endif

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
