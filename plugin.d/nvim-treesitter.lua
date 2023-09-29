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
    "diff",
    "json",
    "yaml",
    "markdown",
    "nix",
    "zig",
    "rust",
    "haskell",
    "python",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",
    "graphql",
  },
  graphql_literal = {
    enable = true,
    custom_language = "typesript",
  },
})

require('treesitter-context').setup()

-- }}}
