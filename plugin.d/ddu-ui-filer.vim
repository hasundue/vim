"
" ftplugin["ddu-filer"] {
"
nnoremap <buffer><expr><silent> <CR>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'narrow'})<CR>" :
  \ "<Cmd>call ddu#ui#do_action('itemAction', {'name': 'open'})<CR>"

nnoremap <buffer><silent> ..
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ 
  \     name: 'narrow', 
  \     params: #{ path: '..', }
  \ })<CR>

nnoremap <buffer><expr><silent> <Space>
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

" }
