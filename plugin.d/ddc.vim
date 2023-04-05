"
" Configuration {
"
call ddc#custom#patch_global('ui', 'pum')

call ddc#custom#patch_global('autoCompleteEvents', [
  \   'InsertEnter',
  \   'TextChangedI',
  \   'TextChangedP',
  \   'CmdlineEnter',
  \   'CmdlineChanged',
  \ ])

if has('nvim')
  call ddc#custom#patch_global('sources', [
    \   'skkeleton',
    \   'nvim-lsp',
    \   'file',
    \ ])
else
  call ddc#custom#patch_global('sources', [
    \   'skkeleton',
    \ ])
endif

call ddc#custom#patch_global('cmdlineSources',
  \   ['cmdline', 'cmdline-history', 'file']
  \ )

call ddc#custom#patch_global('sourceOptions', #{
  \   _: #{
  \     matchers: ['matcher_fuzzy'],
  \     sorters: ['sorter_fuzzy'],
  \     converters: ['converter_fuzzy'],
  \   },
  \   nvim-lsp: #{
  \     mark: 'L',
  \     minAutoCompleteLength: 1,
  \     forceCompletionPattern: '\S[\.\[\(\{]\S*'
  \   },
  \   file: #{
  \     mark: 'F',
  \     isVolatile: v:true,
  \     forceCompletionPattern: '\S/\S*'
  \   },
  \   skkeleton: #{
  \     mark: 'S',
  \     matchers: ['skkeleton'],
  \     minAutoCompleteLength: 1,
  \     isVolatile: v:true,
  \   },
  \ })

call ddc#enable()

" }

"
" Keymappings {
"
inoremap <expr> <TAB>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '[\s\\]') ?
  \ '<TAB>' : ddc#map#manual_complete()

inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>

inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

" }

"
" Commandline completion {
"
nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  cnoremap <expr> <Tab>
  \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
  \ exists('b:ddc_cmdline_completion') ?
  \ ddc#map#manual_complete() : &wildcharm->nr2char()

  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
  cnoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  call ddc#custom#patch_buffer('cmdlineSources',
  \ ['cmdline', 'cmdline-history', 'file']
  \ )

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

" }

"
" denops-skkeleton {
"
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

call skkeleton#config({
  \ 'eggLikeNewline': v:true,
  \ 'globalJisyo': expand('~/.cache/skkeleton/SKK-JISYO.L'),
  \ 'completionRankFile': '~/.cache/skkeleton/rank.json',
  \ })

" }
