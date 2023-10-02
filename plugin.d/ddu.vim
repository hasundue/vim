"
" hook_source {{{
"
call ddu#custom#load_config(expand('~/.config/vim/plugin.d/ddu.ts'))

"
" ddu-ff_ddu-filer {{{
"
nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> -
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> <C-l>
  \ <Cmd>call ddu#ui#do_action('refreshItems')<CR>

nnoremap <buffer><silent> =
  \ <Cmd>call ddu#ui#do_action('toggleAllItems')<CR>

nnoremap <buffer><silent> sp
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'split' } })<CR>

nnoremap <buffer><silent> vs
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'vsplit' } })<CR>

nnoremap <buffer><silent> D
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete' })<CR>

nnoremap <buffer><silent> N
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>

nnoremap <buffer><silent> R
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename' })<CR>

" }}}
