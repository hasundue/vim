"
" hook_add {{{
"
nnoremap <silent> <leader>f <Cmd>Ddu file_external
  \ -name=ff-file -ui=ff -resume<CR>

nnoremap <silent> <leader>m <Cmd>Ddu mr
  \ -name=ff-mr -ui=ff<CR>

nnoremap <silent> <leader>b <Cmd>Ddu buffer
  \ -name=ff-mr -ui=ff<CR>

nnoremap <silent> <leader>c <Cmd>Ddu file_external
  \ -name=ff-rc -ui=ff -resume
  \ -source-option-file_external-path='`expand('~/.config/vim')`'<CR>

nnoremap <silent> <leader>r <Cmd>Ddu rg
  \ -name=ff-grep -ui=ff -resume<CR>

nnoremap <silent> <leader>h <Cmd>Ddu help
  \ -name=ff-help -ui=ff -resume<CR>

nnoremap <silent> <leader>g <Cmd>Ddu git_status
  \ -name=ff-git -ui=ff
  \ -source-option-git_status-path='`expand('%:h')`'<CR>

" nnoremap <silent> <leader>p <Cmd>Ddu dein
"   \ -name=ff-plugin -ui=ff -resume<CR>

" }}}

"
" hook_source {{{
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     ff: #{
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

nnoremap <buffer><silent> a
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'add' })<CR>

nnoremap <buffer><silent> cc
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'commit' })<CR>

nnoremap <buffer><silent> A
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'executeGit', params: #{ command: ['add', '--all'] } })<CR>

nnoremap <buffer><silent> x
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'reset' })<CR>

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
