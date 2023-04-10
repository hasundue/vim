"
" hook_add {
"
let g:copilot_filetypes = #{
  \ gitcommit: v:true,
  \ markdown: v:true,
  \ text: v:true,
  \ ddu-ff-filter: v:false,
  \ }

nnoremap <silent> <leader>cp <CMD>Copilot panel<CR>

" }
