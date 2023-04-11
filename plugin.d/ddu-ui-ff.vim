"
" hook_add {{{
"
nnoremap <silent> <leader>ff <cmd>Ddu 
  \ -name=ff-file -ui=ff -resume -volatile file_external<CR>
nnoremap <silent> <leader>fc <cmd>Ddu
  \ -name=ff-rc -ui=ff -resume -volatile
  \ -source-option-path='`expand('~/.config/vim')`' file_external<CR>
nnoremap <silent> <leader>fg <cmd>Ddu
  \ -name=ff-grep -ui=ff -volatile -resume rg<CR>
nnoremap <silent> <leader>fh <cmd>Ddu
  \ -name=ff-help -ui=ff -resume help<CR>
nnoremap <silent> <leader>fp <cmd>Ddu
  \ -name=ff-plugin -ui=ff -resume dein<CR>

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
inoremap <buffer> <CR>
  \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer> <CR>
  \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

" }}}
