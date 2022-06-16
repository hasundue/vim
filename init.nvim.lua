--
-- Appearance {
--
vim.go.pumblend = 10
vim.go.winblend = 10

-- }

-- 
-- Terminal {
-- 
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  callback = function()
    vim.opt_local.termguicolors = true
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})

-- }
