-- 
-- Appearance
--
vim.go.cmdheight = 0

vim.go.pumblend = 15
vim.go.winblend = 15

--
-- Clipboard
--
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.clipboard.osc52').copy,
    ['*'] = require('vim.clipboard.osc52').copy,
  },
  paste = {
    ['+'] = require('vim.clipboard.osc52').paste,
    ['*'] = require('vim.clipboard.osc52').paste,
  },
}
