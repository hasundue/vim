"
" Basics {
"
set expandtab
set tabstop=4
set shiftwidth=4

" }


"
" autoread {
"
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" }

