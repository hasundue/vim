"
" hook_source {
"
call ddu#custom#patch_global(#{
  \   ui: 'ff',
  \   uiParams: #{
  \     ff: #{
  \       startFilter: v:true,
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
  \       floatingBorder: [ '+', '-', '+', '|', '+', '-', '+', '|' ],
  \     },
  \   }
  \ })
endif

" }
