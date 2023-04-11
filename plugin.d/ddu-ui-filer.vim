"
" hook_add {
"
nnoremap <silent> <leader>tf <CMD>Ddu
  \ -name=filer-file -ui=filer -resume -volatile file<CR>
nnoremap <silent> <leader>th <CMD>Ddu
  \ -name=filer-home -ui=filer -resume -volatile
  \ -source-option-path='`expand('~')`' file<CR>
nnoremap <silent> <leader>tc <CMD>Ddu
  \ -name=filer-rc -ui=filer -resume -volatile
  \ -source-option-path='`expand('~/.config/vim')`' file<CR>

" }

"
" hook_source {
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

" }

"
" ftplugin["ddu-filer"] {
"
nnoremap <buffer><expr> <leader>.
	\ ddu#ui#do_action('updateOptions', {
	\   'sourceOptions': {
	\     'file': {
	\       'matchers': <SID>ToggleHidden(),
	\     },
	\   },
	\ })

function! ToggleHidden()
	const current = ddu#custom#get_current(b:ddu_ui_name)
	const source_options = get(current, 'sourceOptions', {})
	const source_options_file = get(source_options, 'file', {})
	const matchers = get(source_options_file, 'matchers', [])
	return empty(matchers) ? ['matcher_hidden'] : []
endfunction

nnoremap <buffer><expr> <CR>
  \ ddu#ui#get_item()->get('isTree', v:false) ?
  \   ddu#ui#do_action('itemAction', #{ name: 'narrow' }) :
  \   ddu#ui#do_action('itemAction', #{ name: 'open' })

nnoremap <buffer><expr> ..
  \ ddu#ui#do_action('itemAction', #{ 
  \   name: 'narrow', 
  \   params: #{ path: '..' }
  \ })

nnoremap <buffer><expr> <C-CR>
  \ ddu#ui#do_action('toggleSelectItem')

nnoremap <buffer><expr> q
  \ ddu#ui#do_action('quit')

nnoremap <buffer><expr> s
  \ ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'split' } })

nnoremap <buffer><expr> v
  \ ddu#ui#do_action('itemAction',
  \   #{ name: 'open', params: #{ command: 'vsplit' } })

nnoremap <buffer><expr> R
  \ ddu#ui#do_action('itemAction', #{ name: 'rename' })

nnoremap <buffer><expr> D
  \ ddu#ui#do_action('itemAction', #{ name: 'delete' })

nnoremap <buffer><expr> <leader>n
  \ ddu#ui#do_action('itemAction', #{ name: 'newFile' })

" }
