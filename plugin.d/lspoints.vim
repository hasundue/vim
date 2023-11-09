"
" hook_source {{{
"
call lspoints#load_extensions([
\   'config',
\   'format',
\   'nvim_diagnostics',
\   'hover',
\ ])
call lspoints#settings#patch(#{
\   tracePath: '/tmp/lspoints',
\ })

" }}}

"
" hook_add {{{
"
function s:on_attach() abort
  nnoremap <buffer> K
    \ <Cmd>call denops#request(
    \   'lspoints',
    \   'executeCommand',
    \   [
    \     'hover',
    \     'execute',
    \     #{
    \       border: 'none',
    \     },
    \   ],
    \ )<CR>
  augroup lspoints
    autocmd!
    autocmd BufWritePre <buffer> call denops#request(
      \   'lspoints',
      \   'executeCommand',
      \   [
      \     'format',
      \     'execute',
      \     bufnr(),
      \   ]
      \ )
  augroup END
endfunction
autocmd User LspointsAttach:* call s:on_attach()

autocmd FileType typescript,typescriptreact call lspoints#attach('denols')

" }}}
