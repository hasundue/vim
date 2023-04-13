" enable 24-bit colors
if has('termguicolors')
  set termguicolors
endif

" gruvbox-material (dark, hard)
let g:color#fg = '#d4be98'
let g:color#fg_pum = '#ddc7a1'

let g:color#red = '#ea6962'
let g:color#orange = '#e78a4e'
let g:color#yellow = '#d8a657'
let g:color#green = '#a9b665'
let g:color#aqua = '#89b482'
let g:color#blue = '#7daea3'
let g:color#purple = '#d3869b'
let g:color#grey = '#928374'

let g:color#bg = '#1d2021'
let g:color#bg_pum = '#3c3836'
let g:color#bg_red = '#ea6962'
let g:color#bg_green = '#a9b665'
let g:color#bg_yellow = '#d8a657'

let s:highlights = #{
  \   Normal: [ g:color#fg ],
  \
  \   Grey: [ g:color#grey ],
  \   Red: [ g:color#red ],
  \   Orange: [ g:color#orange ],
  \   Yellow: [ g:color#yellow ],
  \   Green: [ g:color#green ],
  \   Blue: [ g:color#blue ],
  \   Cyan: [ g:color#aqua ],
  \   Purple: [ g:color#purple ],
  \   
  \   NormalFloat: [ g:color#fg, g:color#bg ],
  \   FloatBorder: [ g:color#grey, g:color#bg ],
  \   Pmenu: [ g:color#fg_pum, g:color#bg_pum ],
  \   PmenuSbar: [ 'none', g:color#bg_pum ],
  \   PmenuSel: [ g:color#bg_pum, g:color#grey ],
  \
  \   Cursor: [ 'none', 'none', 'reverse' ],
  \   Visual: [ 'none', g:color#grey ],
  \   Search: [ g:color#bg, g:color#bg_green ],
  \   IncSearch: [ g:color#bg, g:color#bg_red ],
  \   MatchParen: [ 'none', g:color#bg_pum ],
  \
  \   Todo: [ g:color#bg, g:color#yellow, 'bold' ],
  \   Underlined: [ 'none', 'none', 'underline' ],
  \
  \   DiffAdd: [ 'none', g:color#green ],
  \   DiffChange: [ 'none', g:color#blue ],
  \   DiffDelete: [ 'none', g:color#bg_red ],
  \   DiffText: [ g:color#bg, g:color#blue ],
  \
  \   TSStrong: [ 'none', 'none', 'bold' ],
  \   TSEmphasis: [ 'none', 'none', 'italic' ],
  \   TSUnderline: [ 'none', 'none', 'underline' ],
  \   TSNote: [ g:color#bg, g:color#green, 'bold' ],
  \   TSWarning: [ g:color#bg, g:color#yellow, 'bold' ],
  \   TSDanger: [ g:color#bg, g:color#red, 'bold' ],
  \ }

" execute `highlight` command for each highlight
for [ group, highlight ] in items(s:highlights)
  let fg = len(highlight) >= 1 ? highlight[0] : 'none'
  let bg = len(highlight) >= 2 ? highlight[1] : 'none'
  let gui = len(highlight) >= 3 ? highlight[2] : 'none'
  execute 'highlight! ' . group . ' guifg=' . fg . ' guibg=' . bg . ' gui=' . gui . ' blend=' . 15
endfor

let s:links = #{
  \   SignColumn: 'Normal',
  \   LineNr: 'Grey',
  \
  \   ToolbarLine: 'Normal',
  \   StatusLine: 'Grey',
  \   StatusLineTerm: 'Grey',
  \   StatusLineNC: 'Grey',
  \   StatusLineTermNC: 'Grey',
  \
  \   Folded: 'Grey',
  \   Conceal: 'Grey',
  \   NonText: 'Grey',
  \   WhiteSpace: 'Grey',
  \   SpecialKey: 'Grey',
  \
  \   CurSearch: 'IncSearch',
  \
  \   ErrorMsg: 'Red',
  \   WarningMsg: 'Yellow',
  \   MoreMsg: 'Yellow',
  \
  \   Directory: 'Green',
  \
  \   Boolean: 'Purple',
  \   Number: 'Purple',
  \   Float: 'Purple',
  \
  \   PreProc: 'Purple',
  \   PreCondit: 'Purple',
  \   Include: 'Purple',
  \   Define: 'Purple',
  \   Conditional: 'Red',
  \   Repeat: 'Red',
  \   Keyword: 'Red',
  \   Typedef: 'Red',
  \   Exeption: 'Red',
  \   Statement: 'Red',
  \
  \   Error: 'Red',
  \   StorageClass: 'Orange',
  \   Tag: 'Orange',
  \   Label: 'Orange',
  \   Structure: 'Orange',
  \   Operator: 'Orange',
  \   Title: 'Orange',
  \   Special: 'Yellow',
  \   SpecialChar: 'Yellow',
  \   Type: 'Yellow',
  \   Function: 'Green',
  \   String: 'Green',
  \   Character: 'Green',
  \   Constant: 'Cyan',
  \   Macro: 'Cyan',
  \   Identifier: 'Blue',
  \   
  \   Comment: 'Grey',
  \   SpecialComment: 'Grey',
  \
  \   Delimiter: 'Normal',
  \   Ignore: 'Grey',
  \ }

" execute `highlight link` command for each link
for [ group, link ] in items(s:links)
  execute 'highlight! link ' . group . ' ' . link
endfor
