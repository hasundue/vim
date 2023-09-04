"
" hook_add {{{
" 
if has('termguicolors')
  set termguicolors
endif

set background=dark

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_sign_column_background = 'none'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_material_diagnostic_text_highlight = 1
let g:gruvbox_material_diagnostic_virtual_text = 'colored'
let g:gruvbox_material_transparent_background = 0
" let g:gruvbox_material_disable_italic_comment = 1

colorscheme gruvbox-material

" }}}
