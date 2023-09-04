--
-- lua_source {{{
--
require("mason-lspconfig").setup({
  automatic_installation = {
    exclude = { "denols", "zls", "nil_ls" },
  },
})
-- }}}
