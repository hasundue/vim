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

"
" Append the diff of the staged changes to the commit message
" for autocomplete of the commit message
"
function s:append_diff() abort
  let diff = system('git diff --cached')
  let comment_diff = join(map(split(diff, '\n'), {idx, line -> '# ' . line}), "\n")
  call append(line('$'), '# --- Staged Changes Diffs ---')
  call append(line('$'), split(comment_diff, '\n'))
endfunction

autocmd BufReadPost COMMIT_EDITMSG call s:append_diff()

" }
