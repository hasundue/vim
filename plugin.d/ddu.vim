"
" Commands {
"
nnoremap <silent> <leader>uf <cmd>Ddu 
  \ file_external<CR>
nnoremap <silent> <leader>uc <cmd>Ddu
  \ file_external -source-option-path='`expand('~/.config/vim')`'<CR>
nnoremap <silent> <leader>ug <cmd>Ddu
  \ rg<CR>
nnoremap <silent> <leader>uh <cmd>Ddu
  \ help<CR>
nnoremap <silent> <leader>ut <cmd>Ddu
  \ -name=filer -ui=filer -resume=v:true file<CR>

" }

"
" Configurations {
"
call ddu#custom#patch_global(#{
\   ui: 'ff',
\   uiParams: #{
\     ff: #{
\       startFilter: v:true,
\     },
\   },
\   sourceOptions: #{
\     file_external: #{
\       matchers: ['matcher_zf'],
\     },
\     rg: #{
\       matchers: [],
\     },
\     file: #{
\       columns: ['filename'],
\     },
\     help: #{
\       matchers: ['matcher_zf'],
\     },
\   },
\   sourceParams: #{
\     file_external: #{
\       cmd: ['git', 'ls-files', '--cached', '--recurse-submodules', '--exclude-standard'],
\     },
\     rg: #{
\       args: ['--column', '--no-heading', '--color', 'never'],
\     },
\   },
\   filterParams: #{
\     matcher_zf: #{
\       caseSensitive: v:false,
\       strictPath: v:false,
\     },
\   },
\   kindOptions: #{
\     file: #{
\       defaultAction: 'open',
\     },
\     help: #{
\       defaultAction: 'open',
\     },
\   },
\   actionOptions: #{
\     echo: #{
\       quit: v:false,
\     },
\     echoDiff: #{
\       quit: v:false,
\     },
\     narrow: #{
\       quit: v:false,
\     },
\   },
\ })

if has('nvim')
  call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     _: #{
  \       split: 'floating',
  \       filterFloatingPosition: 'top',
  \       filterSplitDirection: 'floating',
  \       floatingBorder: 'none',
  \     },
  \   }
  \ })
endif

"
" ddu-ui-ff {
"
autocmd FileType ddu-ff call s:ddu_ff_config()
autocmd FileType ddu-ff-filter call s:ddu_ff_filter_config()

function! s:ddu_ff_config() abort
  nnoremap <buffer><silent> <CR>
  \ <Cmd>call ddu#ui#do_action('itemAction')<CR>

  nnoremap <buffer><silent> <Space>
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

  nnoremap <buffer><silent> i
  \ <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>

  nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

function! s:ddu_ff_filter_config() abort
  inoremap <buffer> <CR>
  \ <Esc><Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>

  nnoremap <buffer> <CR>
  \ <Cmd>call ddu#ui#do_action('closeFilterWindow')<CR>
endfunction

"

"
" ddu-ui-filer {
"
autocmd FileType ddu-filer call s:ddu_filer_config()

function! s:ddu_filer_my_settings() abort
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
endfunction

" }
