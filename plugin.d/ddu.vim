"
" hook_source {{{
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     _: #{
  \       autoAction: #{
  \         name: 'preview',
  \       },
  \       floatingBorder: 'rounded',
  \       highlights: #{
  \         floating: 'Normal',
  \         floatingBorder: 'WinSeparator',
  \       },
  \       previewFloating: &lines > 40,
  \       previewFloatingBorder: 'rounded',
  \       previewCol: "(&columns - eval(uiParams.winWidth)) / 2",
  \       previewHeight: &lines / 2 - 2,
  \       previewRow: &lines / 2 + &lines / 2,
  \       previewWidth: min([&columns, 80]),
  \       previewWindowOptions: [["&number", v:true]],
  \       startAutoAction: v:true,
  \       statusLine: v:true,
  \       winHeight: 10,
  \       winRow: &lines / 2 - 12,
  \       winWidth: min([&columns, 80]),
  \       split: has('nvim') ? 'floating' : 'horizontal',
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
  \     git_status: #{
  \       converters: ['converter_git_status'],
  \       path: expand('%:h'),
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
  \     git_status: #{
  \       defaultAction: 'open',
  \     },
  \   },
  \ })

call ddu#custom#action('kind', 'git_status', 'commit',
  \   { args -> execute('!cd ' . expand('%:h') . ' && git commit -m "' . input('Commit message: ') . '"') }
  \ )

" }}}

"
" ddu-ff_ddu-filer {{{
"
nnoremap <buffer><silent> q
  \ <Cmd>call ddu#ui#do_action('quit')<CR>

nnoremap <buffer><silent> -
  \ <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>

nnoremap <buffer><silent> <C-l>
  \ <Cmd>call ddu#ui#do_action('refreshItems')<CR>

nnoremap <buffer><silent> =
  \ <Cmd>call ddu#ui#do_action('toggleAllItems')<CR>

nnoremap <buffer><silent> sp
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'split' } })<CR>

nnoremap <buffer><silent> vs
  \ <Cmd>call ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'vsplit' } })<CR>

nnoremap <buffer><silent> D
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'delete' })<CR>

nnoremap <buffer><silent> N
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'newFile' })<CR>

nnoremap <buffer><silent> R
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'rename' })<CR>

" }}}
