"
" hook_add {
"
let g:copilot_filetypes = #{
  \ gitcommit: v:true,
  \ markdown: v:true,
  \ text: v:true,
  \ ddu-ff-filter: v:false,
  \ }

" Disable tab mapping
let g:copilot_no_tab_map = v:true

inoremap <silent><script><expr> <M-j> copilot#Accept("\<CR>")
inoremap <silent><script><expr> <M-k> copilot#Dismiss()

nnoremap <silent> <M-p> <CMD>Copilot panel<CR>

" }
