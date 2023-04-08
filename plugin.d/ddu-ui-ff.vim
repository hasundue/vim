"
" hook_add {
"
nnoremap <silent> <leader>uf <cmd>Ddu 
  \ -ui=ff -resume file_external<CR>
nnoremap <silent> <leader>uc <cmd>Ddu
  \ -ui=ff -resume file_external -source-option-path='`expand('~/.config/vim')`'<CR>
nnoremap <silent> <leader>ug <cmd>Ddu
  \ -name=grep -ui=ff -volatile -resume rg<CR>
nnoremap <silent> <leader>uh <cmd>Ddu
  \ -ui=ff -resume help<CR>
nnoremap <silent> <leader>up <cmd>Ddu
  \ -ui=ff -resume dein<CR>

" }

"
" ftplugin["ddu-ff"] {
"
nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#do_action('itemAction')<CR>

nnoremap <buffer><silent> <Space>
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> s
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'split' } })<CR>

nnoremap <buffer><silent> v
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'vsplit' } })<CR>

nnoremap <buffer><silent> R
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename' })<CR>

nnoremap <buffer><silent> N
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>

nnoremap <buffer><silent> D
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete' })<CR>

" }

"
" ftplugin["ddu-ff-filter"] {
"
inoremap <buffer> <CR>
  \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

nnoremap <buffer> <CR>
  \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

" }
