"
" hook_post_update {{{
"
execute '!mkdir -p ~/.cache/skkeleton'
execute '!wget -x -O ~/.cache/skkeleton/SKK-JISYO.L https://raw.githubusercontent.com/skk-dev/dict/master/SKK-JISYO.L'

" }}}

"
" hook_add {{{
"
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

" }}}

"
" hook_source {{{
"
call skkeleton#config({
  \ 'eggLikeNewline': v:true,
  \ 'globalJisyo': '~/.cache/skkeleton/SKK-JISYO.L',
  \ 'completionRankFile': '~/.cache/skkeleton/rank.json',
  \ })

" }}}
