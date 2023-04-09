"
" hook_add {
"
nnoremap <silent> <leader>tf <cmd>Ddu
  \ -name=filer-file -ui=filer -resume -volatile file<CR>
nnoremap <silent> <leader>th <cmd>Ddu
  \ -name=filer-home -ui=filer -resume -volatile
  \ -source-option-path='`expand('~')`' file<CR>
nnoremap <silent> <leader>tc <cmd>Ddu
  \ -name=filer-rc -ui=filer -resume -volatile
  \ -source-option-path='`expand('~/.config/vim')`' file<CR>

" }

"
" ftplugin["ddu-filer"] {
"
nnoremap <buffer><expr> <CR>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \   "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>" :
  \   "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open' })<CR>"

nnoremap <buffer><silent> ..
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ 
  \   name: 'narrow', 
  \   params: #{ path: '..' }
  \ })<CR>

nnoremap <buffer><expr><silent> <Space>
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

" }
