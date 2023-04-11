"
" hook_add {{{
"
nnoremap <silent> <leader>ff <Cmd>Ddu 
  \ -name=ff-file -ui=ff -resume file_external<CR>
nnoremap <silent> <leader>fc <Cmd>Ddu
  \ -name=ff-rc -ui=ff -resume
  \ -source-option-path='`expand('~/.config/vim')`' file_external<CR>
nnoremap <silent> <leader>fg <Cmd>Ddu
  \ -name=ff-grep -ui=ff -resume rg<CR>
nnoremap <silent> <leader>fh <Cmd>Ddu
  \ -name=ff-help -ui=ff -resume help<CR>
nnoremap <silent> <leader>fp <Cmd>Ddu
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
inoremap <buffer><silent> <CR>
  \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

" }}}
