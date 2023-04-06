"
" hook_add {
"
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

" }

"
" hook_source {
"
call skkeleton#config({
  \ 'eggLikeNewline': v:true,
  \ 'globalJisyo': expand('~/.cache/skkeleton/SKK-JISYO.L'),
  \ 'completionRankFile': '~/.cache/skkeleton/rank.json',
  \ })

" }
