--
-- lua_source {
--
local lspconfig = require("lspconfig")

lspconfig.vimls.setup({
  autostart = true,
})

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
    workspace = {
      library = vim.api.nvim_get_runtime_file("", true),
    },
  },
  autostart = true,
})

lspconfig.bashls.setup {}

lspconfig.denols.setup({
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern(
    "denops",
    "deno.json",
    "deno.jsonc"
  ),
  init_options = {
    lint = false,
    unstable = true
  },
})

lspconfig.tsserver.setup {
  single_file_support = false,
  root_dir = lspconfig.util.root_pattern("package.json"),
}

lspconfig.eslint.setup {
  root_dir = lspconfig.util.root_pattern(".eslintrc*"),
}

lspconfig.cssls.setup {}

lspconfig.sqlls.setup {}

lspconfig.jsonls.setup {}

lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}

lspconfig.julials.setup({
  autostart = true,
})

lspconfig.zls.setup({})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

    vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = { "*.js", "*.ts", "*.zig", "*.md" },
      group = 'UserLspConfig',
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end,
})

-- }
