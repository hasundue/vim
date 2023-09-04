"
" hook_add {{{
"
let g:copilot_filetypes = #{
  \   gitcommit: v:true,
  \   markdown: v:true,
  \   yaml: v:true,
  \   text: v:true,
  \   nix: v:true,
  \   ddu-ff-filter: v:false,
  \ }

" Use <M-CR> to accept the suggestion and insert a newline
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <CR> copilot#Accept("\<CR>")

"
" Append the diff of the staged changes to the commit message
" for autocompletion of the commit message
"
function s:append_diff() abort
  " Get the Git repository root directory
  let git_dir = FugitiveGitDir()
  let git_root = fnamemodify(git_dir, ':h')

  " Get the diff of the staged changes relative to the Git repository root
  let diff = system('git -C ' . git_root . ' diff --cached')

  " Add a comment character to each line of the diff
  let comment_diff = join(map(split(diff, '\n'), {idx, line -> '# ' . line}), "\n")

  " Append the diff to the commit message
  call append(line('$'), split(comment_diff, '\n'))
endfunction

autocmd BufReadPost COMMIT_EDITMSG call s:append_diff()

" }}}
