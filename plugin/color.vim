" enable 24-bit colors
if has('termguicolors')
  set termguicolors
endif

" gruvbox-material (dark, hard)
let g:color#fg = '#D4BE98'
let g:color#red = '#EA6962'
let g:color#orange = '#E78A4E'
let g:color#yellow = '#D8A657'
let g:color#green = '#A9B665'
let g:color#aqua = '#89B482'
let g:color#blue = '#7DAEA3'
let g:color#purple = '#D3869B'

let g:color#grey = '#928374'

let g:color#bg = '#1d2021'
let g:color#bg_red = '#EA6962'
let g:color#bg_green = '#A9B665'
let g:color#bg_yellow = '#D8A657'

let s:highlights = #{
  \   Normal: [ g:color#fg ],
  \
  \   Gray: [ g:color#grey ],
  \   Red: [ g:color#red ],
  \   Orange: [ g:color#orange ],
  \   Yellow: [ g:color#yellow ],
  \   Green: [ g:color#green ],
  \   Blue: [ g:color#blue ],
  \   Aqua: [ g:color#aqua ],
  \   Purple: [ g:color#purple ],
  \   
  \   NormalFloat: [ g:color#fg, g:color#bg ],
  \   FloatBorder: [ g:color#grey, g:color#bg ],
  \
  \   Cursor: [ 'none', 'none', 'reverse' ],
  \   Visual: [ 'none', g:color#grey ],
  \   Search: [ g:color#bg, g:color#bg_green ],
  \   IncSearch: [ g:color#bg, g:color#bg_red ],
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
  \   ToolbarLine: 'Normal',
  \   LineNr: 'Gray',
  \   Folded: 'Gray',
  \   Conceal: 'Gray',
  \   NonText: 'Gray',
  \
  \   Pmenu: 'NormalFloat',
  \   CurSearch: 'IncSearch',
  \
  \   ErrorMsg: 'Red',
  \   WarningMsg: 'Yellow',
  \   MoreMsg: 'Yellow',
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
  \   Constant: 'Aqua',
  \   Macro: 'Aqua',
  \   Identifier: 'Blue',
  \   
  \   Comment: 'Gray',
  \   SpecialComment: 'Gray',
  \
  \   Delimiter: 'Normal',
  \   Ignore: 'Gray',
  \ }

" execute `highlight link` command for each link
for [ group, link ] in items(s:links)
  execute 'highlight! link ' . group . ' ' . link
endfor
