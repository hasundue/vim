"
" hook_add {{{
"
function! FloatermOpen(name, cmd)
  let buf = expand('%:p:h')
  let root = floaterm#path#get_root(buf)
  let name = a:name . ':///' . root
  let bufnr = floaterm#terminal#get_bufnr(name)
  if bufnr < 0
    call floaterm#new(v:true, a:cmd, #{}, #{ name: name, cwd: root })
  else
    call floaterm#show(v:false, bufnr, name)
  endif
endfunction

nnoremap <silent> <leader>g :call FloatermOpen('gitui', 'gitui')<CR>

nnoremap <silent> <leader>1 :FloatermToggle term-1<CR>
nnoremap <silent> <leader>2 :FloatermToggle term-2<CR>
nnoremap <silent> <leader>3 :FloatermToggle term-3<CR>
nnoremap <silent> <leader>4 :FloatermToggle term-4<CR>
nnoremap <silent> <leader>5 :FloatermToggle term-5<CR>

nnoremap <silent> <C-[> :FloatermHide<CR>

" }}}

"
" hook_source {{{
"

" }}}
