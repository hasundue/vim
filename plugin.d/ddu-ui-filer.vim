"
" hook_add {{{
"
nnoremap <silent> <leader>t <CMD>Ddu
  \ -name=filer-file -ui=filer -resume file<CR>

" }}}

"
" hook_source {{{
"
call ddu#custom#patch_global(#{
  \   uiParams: #{
  \     filer: #{
  \       sort: 'filename',
  \       sortTreeFirst: v:false,
  \     },
  \   },
  \   actionOptions: #{
  \     narrow: #{
  \       quit: v:false,
  \     },
  \   },
  \ })

" }}}

"
" ddu-filer {{{
"
nnoremap <buffer> h
	\ <Cmd>call ddu#ui#do_action('updateOptions', {
	\   'sourceOptions': {
	\     'file': {
	\       'matchers': ToggleHidden(),
	\     },
	\   },
	\ })<CR>

function! ToggleHidden()
	const current = ddu#custom#get_current(b:ddu_ui_name)
	const source_options = get(current, 'sourceOptions', {})
	const source_options_file = get(source_options, 'file', {})
	const matchers = get(source_options_file, 'matchers', [])
	return empty(matchers) ? ['matcher_hidden'] : []
endfunction

nnoremap <buffer><expr> <CR>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \   "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'narrow' })<CR>" :
  \   "<Cmd>call ddu#ui#do_action('itemAction', #{ name: 'open' })<CR>"

nnoremap <buffer> ..
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ 
  \   name: 'narrow', 
  \   params: #{ path: '..' }
  \ })<CR>

nnoremap <buffer><silent> dd
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'move' })<CR>

nnoremap <buffer><silent> yy
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'copy' })<CR>

nnoremap <buffer><silent> p
  \ <Cmd>call ddu#ui#do_action('itemAction', #{ name: 'paste' })<CR>

" }}}
