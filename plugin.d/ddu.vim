"
" hook_add {
"
nnoremap <silent> <leader>uf <cmd>Ddu 
  \ -ui=ff file_external<CR>
nnoremap <silent> <leader>uc <cmd>Ddu
  \ -ui=ff file_external -source-option-path='`expand('~/.config/vim')`'<CR>
nnoremap <silent> <leader>ug <cmd>Ddu
  \ -ui=ff rg<CR>
nnoremap <silent> <leader>uh <cmd>Ddu
  \ -ui=ff help<CR>
nnoremap <silent> <leader>ut <cmd>Ddu
  \ -name=filer -ui=filer -resume=v:true file<CR>

" }

"
" hook_source {
"
call ddu#custom#patch_global(#{
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

" }
