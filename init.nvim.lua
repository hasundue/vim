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

local config_term = function()
  vim.opt_local.termguicolors = true
  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
end

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  callback = config_term,
})

-- open a terminal if nvim is executed without an argument
vim.api.nvim_create_autocmd({ "VimEnter" }, {
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    if (bufname == "") then
      vim.api.nvim_command("term")
      config_term()
    end
  end
})

-- }
