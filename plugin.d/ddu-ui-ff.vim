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

nnoremap <silent> <leader>d <Cmd>Ddu help
  \ -name=ff-help -ui=ff -resume<CR>

" nnoremap <silent> <leader>g <Cmd>Ddu git_status
"   \ -name=ff-git -ui=ff
"   \ -source-option-git_status-path='`expand('%:h')`'<CR>

nnoremap <silent> <leader>i <Cmd>Ddu github_repo_issue
  \ -name=ff-gh-issue -ui=ff -resume<CR>

nnoremap <silent> <leader>p <Cmd>Ddu github_repo_pull
  \ -name=ff-gh-pr -ui=ff -resume<CR>

" }}}

"
" ddu-ff {{{
"
nnoremap <buffer><silent> <CR> 
  \ <Cmd>call ddu#ui#do_action('itemAction')<CR>

nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

"
" git_status
"
nnoremap <buffer><silent> a
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'add' })<CR>

nnoremap <buffer><silent> r
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'reset' })<CR>

nnoremap <buffer><silent> p
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'patch' })<CR>

nnoremap <buffer><silent> cc
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'commit' })<CR>

nnoremap <buffer><silent> ca
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'commit_amend' })<CR>

nnoremap <buffer><silent> X
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'restore' })<CR>

nnoremap <buffer><silent> P
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'push' })<CR>

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
