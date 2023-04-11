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
  \         floatingBorder: 'WinSeparator',
  \       },
  \       statusLine: v:true,
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
  \       matchers: ['matcher_hidden'],
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
  \ })

" }
