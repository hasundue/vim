"
" hook_source {
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     _: #{
  \       split: has('nvim') ? 'floating' : 'horizontal',
  \       floatingBorder: 'rounded',
  \       highlights: #{
  \         floating: 'Normal',
  \         floatingBorder: 'Green',
  \       },
  \     },
  \     ff: #{
  \       startFilter: v:true,
  \       filterSplitDirection: has('nvim') ? 'floating' : 'bottomright',
  \       filterFloatingPosition: 'top',
  \     },
  \   },
  \   sourceOptions: #{
  \     _: #{
  \       matchers: ['matcher_zf'],
  \     },
  \     rg: #{
  \       matchers: [],
  \     },
  \     file: #{
  \       columns: ['filename'],
  \     },
  \   },
  \   sourceParams: #{
  \     file_external: #{
  \       cmd: ['git', 'ls-files', '-co', '--exclude-standard'],
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
  \     dein: #{
  \       defaultAction: 'open',
  \     },
  \   },
  \   actionOptions: #{
  \     narrow: #{
  \       quit: v:false,
  \     },
  \   },
  \ })

" }
