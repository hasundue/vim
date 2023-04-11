"
" hook_add {{{
"
set laststatus=2
set showtabline=1

let g:lightline = #{
  \   colorscheme: 'gruvbox_material',
  \
  \   separator: { 'left': "\ue0b0", 'right': "\ue0b2" },
  \   subseparator: { 'left': "\ue0b1", 'right': "\ue0b3" },
  \
  \   active: {
  \     'left': [ 
  \       [ 'mode', 'paste' ],
  \       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
  \     ],
  \     'right': [
  \       [ 'lineinfo' ],
  \       [ 'filetype', 'percent' ],
  \     ],
  \   },
  \   component_function: {
  \     'gitbranch': 'FugitiveHead'
  \   },
  \
  \   tabline: {
  \     'left': [ ['buffers'] ],
  \     'right': [],
  \   },
  \   component_expand: {
  \     'buffers': 'lightline#bufferline#buffers',
  \   },
  \   component_type: {
  \     'buffers': 'tabsel',
  \   },
  \ }

" }}}
