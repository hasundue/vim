"
" hook_add {{{
"
nnoremap <silent> <leader>f <Cmd>Ddu file_external
  \ -name=ff-file -ui=ff -resume<CR>

nnoremap <silent> <leader>uc <Cmd>Ddu file_external
  \ -name=ff-rc -ui=ff -resume
  \ -source-option-file_external-path='`expand('~/.config/vim')`'<CR>

nnoremap <silent> <leader>ug <Cmd>Ddu rg
  \ -name=ff-grep -ui=ff -resume<CR>

nnoremap <silent> <leader>uh <Cmd>Ddu help
  \ -name=ff-help -ui=ff -resume<CR>

nnoremap <silent> <leader>up <Cmd>Ddu dein
  \ -name=ff-plugin -ui=ff -resume<CR>

" }}}

"
" hook_source {{{
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     ff: #{
  \       startFilter: v:true,
  \       filterSplitDirection: has('nvim') ? 'floating' : 'bottomright',
  \       filterFloatingPosition: 'top',
  \     },
  \   },
  \ })

" }}}

"
" ddu-ff {{{
"
nnoremap <buffer><silent> <CR> 
  \ <Cmd>call ddu#ui#do_action('itemAction')<CR>

nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

" }}}

"
" ddu-ff-filter {{{
"
inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

" }}}
