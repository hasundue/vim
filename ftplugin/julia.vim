"
" Basics {
"
set expandtab
set tabstop=2
set shiftwidth=2

" }


"
" autoread {
"
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" }

