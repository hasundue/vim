--
-- lua_source {{{
--
require("lint").linters_by_ft = {
  yaml = { 'actionlint' },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- }}}
