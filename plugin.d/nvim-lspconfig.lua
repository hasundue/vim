--
-- lua_source {
--
local lspconfig = require("lspconfig")

local function preview_location_callback(_, result, _)
  if result == nil or vim.tbl_isempty(result) then
    vim.notify('No definition found.')
    return nil
  end
  if vim.tbl_islist(result) then
    vim.lsp.util.preview_location(result[1])
  else
    vim.lsp.util.preview_location(result)
  end
end

local function peek_definition()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

local function on_attach(client, bufnr)
  local function cmd(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, buffer = true })
  end

  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  cmd('n', 'gd', vim.lsp.buf.definition)
  cmd('n', 'gD', vim.lsp.buf.declaration)
  cmd('n', 'gK', peek_definition)

  cmd('n', '<leader>q', vim.diagnostic.setloclist)
  cmd('n', '<leader>r', vim.lsp.buf.rename)
  cmd('n', '<leader>K', function() vim.diagnostic.open_float(0, { scope = "line", header = false, focus = false }) end)
  cmd('n', '<leader>n', function() vim.diagnostic.goto_next { float = { header = false } } end)
  cmd('n', '<leader>N', function() vim.diagnostic.goto_prev { float = { header = false } } end)

  if client.server_capabilities.hoverProvider then
    cmd('n', 'K', vim.lsp.buf.hover)
  end

  if client.server_capabilities.inlayHintsProvider then
    require("lsp-inlayhints").on_attach(client, bufnr, false)
  end

  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      group = 'lsp_format',
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end

  if client.server_capabilities.codeLensProvider then
    cmd('n', '<leader>Le', vim.lsp.codelens.display)
    cmd('n', '<leader>Ln', vim.lsp.codelens.run)

    local augroup = vim.api.nvim_create_augroup("LspCodeLens", {})
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr,
      group = augroup,
      callback = function()
        vim.lsp.codelens.refresh()
        local codelens = vim.lsp.codelens.get(bufnr)
        if codelens then
          vim.lsp.codelens.display(codelens, bufnr, client.id)
        end
      end,
    })
  end
end

local servers = {
  lua_ls = {
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
  },
  denols = {
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern(
      "denops",
      "deno.json",
      "deno.jsonc"
    ),
    init_options = {
      lint = true,
      unstable = true
    },
  },
  tsserver = {
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern("package.json"),
  },
  eslint = {
    root_dir = lspconfig.util.root_pattern(".eslintrc*"),
  },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  },
  vimls = {},
  bashls = {},
  cssls = {},
  jsonls = {},
  julials = {},
  zls = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(vim.tbl_extend("force", config, {
    on_attach = on_attach,
  }))
end

-- }
