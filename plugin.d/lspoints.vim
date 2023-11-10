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
  " Open hover for current word
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

  nnoremap <buffer> <M-k> <Cmd>lua vim.diagnostic.open_float()<CR>
  nnoremap <buffer> <M-n> <Cmd>lua vim.diagnostic.goto_next()<CR>
  nnoremap <buffer> <M-p> <Cmd>lua vim.diagnostic.goto_prev()<CR>

  augroup lspoints_on_attach
    autocmd!
    " Format on save
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

augroup lspoints_attach
  autocmd!
  autocmd BufRead *.ts,*.tsx
    \ if match(expand('%:t'), 'ddu-ff:') != 0 |
    \   call lspoints#attach('denols') |
    \ endif
  autocmd BufRead *.nix,
    \ if match(expand('%:t'), 'ddu-ff:') != 0 |
    \   call lspoints#attach('nil', #{ cmd: ["nil"] }) |
    \ endif
augroup END

" }}}
