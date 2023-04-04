-- Build cache of parsers outside of the package manager
local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
vim.opt.runtimepath:append(parser_install_dir)

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {
      "html",
      "javascript",
      "jsx",
      "typescript",
      "tsx",
    },
  },
  yati = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "vim",
    "lua",
    "regex",
    "javascript",
    "jsdoc",
    "typescript",
    "tsx",
    "zig",
    "julia",
    "json",
    "yaml",
    "toml",
    "markdown",
    "html",
    "css",
    "sql",
    "gitattributes",
  },
  parser_install_dir = parser_install_dir,
})

require('treesitter-context').setup()
