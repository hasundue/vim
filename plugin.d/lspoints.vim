"
" hook_add {{{
"
function s:init() abort
  call lspoints#load_extensions([
  \   'config',
  \   'format',
  \   'nvim_diagnostics',
  \   'hover',
  \ ])
  call lspoints#settings#patch(#{
  \   tracePath: '/tmp/lspoints',
  \ })
endfunction
autocmd User DenopsPluginPost:lspoints call s:init()

function s:on_attach() abort
  nnoremap <buffer> K
    \ <Cmd>call denops#request(
    \   'lspoints',
    \   'executeCommand',
    \   [
    \     'hover',
    \     'execute',
    \     #{
    \       border: 'rounded',
    \     },
    \   ],
    \ )<CR>
  augroup lspoints
    autocmd!
    autocmd BufWritePre <buffer>
      \ call denops#request(
      \   'lspoints',
      \   'executeCommand',
      \   ['format', 'execute', bufnr()],
      \ )
  augroup END
endfunction
autocmd User LspointsAttach:* call s:on_attach()

autocmd FileType typescript,typescriptreact
  \ call lspoints#attach('denols', #{ cmd: ['deno', 'lsp'] })

" }}}
