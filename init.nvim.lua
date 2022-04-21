-- 
-- Terminal {
-- 
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = {"*"},
  callback = function()
    vim.o.termguicolors = true
    vim.wo.number = false
    vim.wo.relativenumber = false
  end
})

-- }
