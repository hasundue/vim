--
-- lua_source {{{
--

-- Build cache of parsers outside of the package manager
require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {
      "javascript",
      "jsx",
      "typescript",
      "tsx",
      "lua",
    },
  },
  yati = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "javascript",
    "typescript",
    "tsx",
    "zig",
    "json",
    "yaml",
    "markdown",
  },
})

require('treesitter-context').setup()

-- }}}
