"
" hook_add {{{
"
nnoremap <silent> <leader>ff <CMD>Ddu 
  \ -name=ff-file -ui=ff -resume file_external<CR>
nnoremap <silent> <leader>fc <CMD>Ddu
  \ -name=ff-rc -ui=ff -resume
  \ -source-option-path='`expand('~/.config/vim')`' file_external<CR>
nnoremap <silent> <leader>fg <CMD>Ddu
  \ -name=ff-grep -ui=ff -resume rg<CR>
nnoremap <silent> <leader>fh <CMD>Ddu
  \ -name=ff-help -ui=ff -resume help<CR>
nnoremap <silent> <leader>fp <CMD>Ddu
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
  \ <CMD>call ddu#ui#do_action('itemAction')<CR>

nnoremap <buffer><silent> i
  \ <CMD>call ddu#ui#do_action('openFilterWindow')<CR>

" }}}

"
" ddu-ff-filter {{{
"
inoremap <buffer><silent> <CR>
  \ <CMD>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> <CR>
  \ <CMD>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer><silent> q
  \ <CMD>call ddu#ui#do_action('quit')<CR>

" }}}
