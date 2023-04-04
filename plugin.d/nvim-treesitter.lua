require'nvim-treesitter.configs'.setup({
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
})

require('treesitter-context').setup()
