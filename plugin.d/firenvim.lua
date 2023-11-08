--
-- lua_post_update {{{
--
vim.fn['firenvim#install'](0)

-- }}}

--
-- lua_add {{{
--
vim.api.nvim_create_autocmd({ 'UIEnter' }, {
  callback = function(event)
    local client = vim.api.nvim_get_chan_info(vim.v.event.chan).client
    if client ~= nil and client.name == "Firenvim" then
      vim.o.laststatus = 0
      vim.o.shortmess = vim.o.shortmess .. 'F'
    end
  end
})

-- }}}
