"
" hook_source {{{
"
call ddc#custom#patch_global(#{
  \   autoCompleteEvents: [
  \     'InsertEnter',
  \     'TextChangedI',
  \     'TextChangedP',
  \   ],
  \   backspaceCompletion: v:true,
  \   cmdlineSources: [
  \     'cmdline',
  \     'cmdline-history',
  \     'file',
  \   ],
  \   sources: [
  \     'file',
  \   ] + ( has('nvim') ? ['nvim-lsp'] : [] ),
  \   ui: 'pum',
  \ })

call ddc#custom#patch_filetype('markdown', 'sources', [
  \   'skkeleton',
  \   'emoji',
  \   'file',
  \ ])

call ddc#custom#patch_global('keywordPattern', '(\k*)|(:\w*)')

call ddc#custom#patch_global('sourceOptions', #{
  \   _: #{
  \     maxItems: 10,
  \     minAutoCompleteLength: 1,
  \     matchers: ['matcher_fuzzy'],
  \     sorters: ['sorter_fuzzy'],
  \     converters: ['converter_fuzzy'],
  \   },
  \   nvim-lsp: #{
  \     mark: 'L',
  \     forceCompletionPattern: '\S[\.\[\(\{]\S*'
  \   },
  \   file: #{
  \     mark: 'F',
  \     isVolatile: v:true,
  \     forceCompletionPattern: '\S\/\S*'
  \   },
  \   skkeleton: #{
  \     mark: 'S',
  \     matchers: ['skkeleton'],
  \     isVolatile: v:true,
  \   },
  \   emoji: #{ 
  \     mark: 'E',
  \     matchers: ['emoji'],
  \     sorters: [],
  \     converters: [],
  \   },
  \   cmdline: #{
  \     mark: '',
  \   },
  \   cmdline-history: #{
  \     mark: '',
  \     forceCompletionPattern: '\s+\S*',
  \     sorters: [],
  \   },
  \ })

call ddc#custom#patch_global('filterParams', {
  \   'matcher_fuzzy': {
  \   'splitMode': 'word'
  \   }
  \ })

call ddc#enable()

" }}}

"
" hook_add {{{
"
inoremap <expr> <C-n> pum#map#insert_relative(+1)
inoremap <expr> <C-p> pum#map#insert_relative(-1)

inoremap <expr> <TAB> pum#visible()
  \ ? '<C-n>'
  \ : getline('.')[0:col('.')] =~# '[\s\\]*' 
  \   ? '<TAB>' 
  \   : ddc#map#manual_complete()

inoremap <expr> <S-Tab> pum#visible()
  \ ? pum#map#insert_relative(-1)
  \ : '<C-h>'

inoremap <expr> <C-y> pum#map#confirm()
inoremap <expr> <C-e> pum#map#cancel()

"
" Commandline completion
"
nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  cnoremap <expr> <Tab> pum#visible()
    \ ? '<Cmd>call pum#map#insert_relative(+1)<CR>'
    \ : exists('b:ddc_cmdline_completion')
    \   ? ddc#map#manual_complete()
    \   : &wildcharm->nr2char()

  cnoremap <expr> <S-Tab> pum#map#insert_relative(-1)
  cnoremap <expr> <C-n>   pum#map#insert_relative(+1)
  cnoremap <expr> <C-p>   pum#map#insert_relative(-1)
  cnoremap <expr> <C-y>   pum#map#confirm()
  cnoremap <expr> <C-e>   pum#map#cancel()

  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  call ddc#custom#patch_buffer('cmdlineSources', [
    \   'file',
    \   'cmdline',
    \   'cmdline-history',
    \ ])
  call ddc#custom#patch_buffer('autoCompleteEvents', [
    \   'CmdlineEnter',
    \   'CmdlineChanged',
    \ ])

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd InsertEnter <buffer> ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
  silent! cunmap <C-n>
  silent! cunmap <C-p>
  silent! cunmap <C-y>
  silent! cunmap <C-e>

  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction

" }}}
