"
" Basics
"
set number
set nowrap
set clipboard+=unnamedplus

"
" Keymaps
"
let mapleader = " "

nnoremap <C-p> :cp<CR>
nnoremap <C-n> :cn<CR>
autocmd QuickFixCmdPost *vimgrep* cwindow
nnoremap giw *:vimgrep /<C-r>// **/*<CR>

"
" Terminal
"
set sh=bash
autocmd TermOpen * setlocal nonumber norelativenumber
" autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
" autocmd BufEnter * if &buftype ==# 'terminal' | startinsert | endif
tnoremap <Esc> <C-\><C-n>

"
" autoread
"
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"
" Languages
"

"
" Plugins
"
call plug#begin(stdpath('data') . '/plugged')

" Essentials
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'romgrk/barbar.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'itchyny/lightline.vim'
Plug 'hrsh7th/vim-searchx'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ddc.vim and dependency
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/pum.vim'

" sources for ddc
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'LumaKernel/ddc-file'

" filters for ddc
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Julia
Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}
Plug 'jpalardy/vim-slime', {'for': 'julia'}

" Dart/Flutter
Plug 'dart-lang/dart-vim-plugin', {'for': 'dart'}
Plug 'thosakwe/vim-flutter', {'for': 'dart'}

" Languages
Plug 'stephpy/vim-yaml', {'for': 'yaml'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}

" Markdown
Plug 'ellisonleao/glow.nvim'

call plug#end()


"
" Plugin-specifics
"

" Netrw
let g:netrw_liststyle=3

" lightline
set noshowmode
let g:lightline = {'colorscheme': 'one'}

" barbar
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.icons = 'numbers'
let bufferline.icon_pinned = 'P'
let bufferline.animation = v:false
let bufferline.clickable = v:false
let bufferline.closable = v:false
let bufferline.tabpages = v:false
nnoremap <silent> <leader>1 :BufferGoto 1<CR>
nnoremap <silent> <leader>2 :BufferGoto 2<CR>
nnoremap <silent> <leader>3 :BufferGoto 3<CR>
nnoremap <silent> <leader>4 :BufferGoto 4<CR>
nnoremap <silent> <leader>5 :BufferGoto 5<CR>
nnoremap <silent> <leader>6 :BufferGoto 6<CR>
nnoremap <silent> <leader>7 :BufferGoto 7<CR>
nnoremap <silent> <leader>8 :BufferGoto 8<CR>
nnoremap <silent> <leader>9 :BufferGoto 9<CR>
nnoremap <silent> <leader>j :BufferPick<CR>
nnoremap <silent> <leader>p :BufferPin<CR>
nnoremap <silent> <leader>c :BufferClose<CR>
nnoremap <silent> <leader>C :BufferCloseAllButPinned<CR>

" doom-one
set termguicolors
colorscheme doom-one

" gitgutter
nnoremap <leader>gu :GitGutterUndoHunk<CR>

" vim-slime
let g:slime_target = 'neovim'
let g:slime_no_mappings = 1
xmap <leader><CR> <Plug>SlimeRegionSend
nmap <leader><CR> <Plug>SlimeParagraphSend

" vim-commentary
nmap <C-_> gcc
vmap <C-_> gc

" glow.nvim
nnoremap <leader>m :Glow<CR>

" JuliaFormatter
nnoremap <leader>jf :JuliaFormatterFormat<CR>
vnoremap <leader>jf :JuliaFormatterFormat<CR>
let g:JuliaFormatter_options = {'style' : 'blue'}

" vim-flutter
let g:flutter_show_log_on_run = "tab"
let g:flutter_autoscroll = 1
nnoremap <leader>fr :FlutterRun<CR>
nnoremap <leader>fq :FlutterQuit<CR>
nnoremap <leader>ft :FlutterTab<CR>


"
" searchx
"

" Overwrite / and ?.
nnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
nnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
xnoremap ? <Cmd>call searchx#start({ 'dir': 0 })<CR>
xnoremap / <Cmd>call searchx#start({ 'dir': 1 })<CR>
cnoremap ; <Cmd>call searchx#select()<CR>

" Move to next/prev match.
nnoremap N <Cmd>call searchx#prev_dir()<CR>
nnoremap n <Cmd>call searchx#next_dir()<CR>
xnoremap N <Cmd>call searchx#prev_dir()<CR>
xnoremap n <Cmd>call searchx#next_dir()<CR>
nnoremap <C-k> <Cmd>call searchx#prev()<CR>
nnoremap <C-j> <Cmd>call searchx#next()<CR>
xnoremap <C-k> <Cmd>call searchx#prev()<CR>
xnoremap <C-j> <Cmd>call searchx#next()<CR>
cnoremap <C-k> <Cmd>call searchx#prev()<CR>
cnoremap <C-j> <Cmd>call searchx#next()<CR>

" Clear highlights
nnoremap <C-l> <Cmd>call searchx#clear()<CR>

let g:searchx = {}

" Auto jump if the recent input matches to any marker.
let g:searchx.auto_accept = v:true

" Marker characters.
let g:searchx.markers = split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '.\zs')

" Convert search pattern.
function g:searchx.convert(input) abort
  if a:input !~# '\k'
    return '\V' .. a:input
  endif
  return join(split(a:input, ' '), '.\{-}')
endfunction


"
" nvim-lspconfig
"

lua << EOF
require'lspconfig'.julials.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        signs = false,
        underline = false,
        update_in_insert = true,
      }
    )
  }
}
require'lspconfig'.dartls.setup{}
EOF

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>


" 
" ddc.vim
"

" Customize global settings
call ddc#custom#patch_global('sources', ['nvim-lsp', 'file', 'around'])
call ddc#custom#patch_global('completionMenu', 'pum.vim')

" Use matcher_head and sorter_rank.
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })

" Change source options
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ 'nvim-lsp': {'mark': 'L'},
      \ 'file': {'mark': 'F',
      \          'isVolatile': v:true,
      \          'forceCompletionPatter': '\S/\S*'
      \ },
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

" Customize settings on a filetype
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#manual_complete()
inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Disable scratch window for preview
set completeopt-=preview

" Use ddc.
call ddc#enable()
