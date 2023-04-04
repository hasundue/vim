--
-- Terminal {
--
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", {})

local function config_term()
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

-- update the current working directory accordingly
vim.api.nvim_create_autocmd({ "TermLeave" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local buftype = vim.api.nvim_buf_get_option(bufnr, 'buftype')
    if buftype == 'terminal' then
      local line = vim.api.nvim_get_current_line()
      local dir = line:match('.*:(.-)%$.*')
      if dir then
        dir = vim.fn.expand(dir)
        vim.api.nvim_command('lcd ' .. vim.fn.fnameescape(dir))
      end
    end
  end
})

-- }
