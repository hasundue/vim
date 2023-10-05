--
-- lua_source {{{
--
require("mason-lspconfig").setup({
  automatic_installation = {
    exclude = { "lua_ls", "denols", "zls", "nil_ls" },
  },
})
-- }}}
