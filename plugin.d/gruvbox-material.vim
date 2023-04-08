"
" hook_add {
" 
if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_transparent_background = 0
" let g:gruvbox_material_disable_italic_comment = 1

colorscheme gruvbox-material

function! s:titlecase(text) abort
  let l:first_char = toupper(strpart(a:text, 0, 1))
  let l:rest_of_string = tolower(strpart(a:text, 1))
  return l:first_char . l:rest_of_string
endfunction

if has('nvim')
  " highlight! link NotifyBackground NormalFloat
  " for level in ['ERROR', 'INFO']
  "   execute 'highlight! link ' . 'Notify' . level . 'Body ' . s:titlecase(level) . 'Text'
  " endfor
  " for level in ['DEBUG', 'TRACE']
  "   execute 'highlight! link ' . 'Notify' . level . 'Body ' . 'HintText'
  " endfor
  " execute 'highlight! link ' . 'NotifyWARNBody ' . 'WarningText'
endif

" }
