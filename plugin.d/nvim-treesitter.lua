--
-- lua_source {{{
--

-- Build cache of parsers outside of the package manager
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "graphql",
    "zig",
    "rust",
    "json",
    "yaml",
    "markdown",
  },
  graphql_literal = {
    enable = true,
    custom_language = "typesript",
  },
})

require('treesitter-context').setup()

-- }}}
