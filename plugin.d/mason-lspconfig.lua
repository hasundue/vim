--
-- lua_source {
--
require("mason-lspconfig").setup({
  automatic_installation = {
    exclude = { "zls" },
  },
})

-- }
