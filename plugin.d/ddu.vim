"
" hook_source {{{
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     _: #{
  \       split: has('nvim') ? 'floating' : 'horizontal',
  \       floatingBorder: 'rounded',
  \       highlights: #{
  \         floating: 'Normal',
  \         floatingBorder: 'WinSeparator',
  \       },
  \       statusLine: v:true,
  \     },
  \   },
  \   sourceOptions: #{
  \     _: #{
  \       matchers: ['matcher_zf'],
  \       sorters: ['sorter_zf'],
  \       converters: ['converter_zf'],
  \     },
  \     rg: #{
  \       volatile: v:true,
  \       matchers: [],
  \     },
  \     file: #{
  \       volatile: v:true,
  \       columns: ['filename'],
  \       matchers: ['matcher_hidden'],
  \     },
  \   },
  \   sourceParams: #{
  \     file_external: #{
  \       cmd: ['git', 'ls-files', '-co', '--exclude-standard'],
  \     },
  \     rg: #{
  \       args: ['--json'],
  \     },
  \   },
  \   filterParams: #{
  \     matcher_zf: #{
  \       caseSensitive: v:false,
  \     },
  \   },
  \   kindOptions: #{
  \     file: #{
  \       defaultAction: 'open',
  \     },
  \     help: #{
  \       defaultAction: 'open',
  \     },
  \     dein: #{
  \       defaultAction: 'open',
  \     },
  \   },
  \ })

" }}}

"
" ddu-ff_ddu-filer {{{
"
nnoremap <buffer><silent> <C-l>
  \ <Cmd>call ddu#ui#do_action('refreshItems')<CR>

nnoremap <buffer><silent> -
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> <S-->
  \ <Cmd>call ddu#ui#do_action('toggleAllItem')<CR>

nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> sp
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'split' } })<CR>

nnoremap <buffer><silent> vs
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'vsplit' } })<CR>

nnoremap <buffer><silent> R
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename' })<CR>

nnoremap <buffer><silent> N
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>

nnoremap <buffer><silent> D
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete' })<CR>

" }}}
