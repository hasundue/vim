--
-- lua_source {{{
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

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.api.nvim_buf_set_option(ev.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { noremap = true, buffer = ev.buf })
    end

    map('n', 'gd', vim.lsp.buf.definition)
    map('n', 'gD', vim.lsp.buf.declaration)
    map('n', 'gK', peek_definition)

    map('n', '<leader>q', vim.diagnostic.setloclist)
    map('n', '<leader>r', vim.lsp.buf.rename)
    map('n', '<leader>K', function() vim.diagnostic.open_float(0, { scope = "line", header = false, focus = false }) end)
    map('n', '<leader>n', function() vim.diagnostic.goto_next { float = { header = false } } end)
    map('n', '<leader>N', function() vim.diagnostic.goto_prev { float = { header = false } } end)

    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    require("lsp_signature").on_attach({
      bind = true,
      doc_lines = 0,
      floating_window = true,
      floating_window_off_y = 0,
      handler_opts = {
        border = "none",
      },
      hint_enable = false,
      padding = ' ',
      transparency = 30,
    }, ev.buf)

    if client.server_capabilities.hoverProvider then
      map('n', 'K', vim.lsp.buf.hover)
    end

    if client.supports_method(inlay_hint) then
      vim.cmd('highlight link LspInlayHint Comment')
      vim.lsp.inlay_hint(ev.buf, true)
    end

    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = ev.buf,
        group = vim.api.nvim_create_augroup("LspFormat", {}),
        callback = function()
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end
})

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
    cmd = { "deno", "lsp", "--unstable" },
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern(
      "denops",
      "deno.json",
      "deno.jsonc"
    ),
    settings = {
      deno = {
        enable = true,
        unstable = true,
        suggest = {
          autoImports = true,
          imports = {
            autoDiscover = true,
            hosts = {
              ["https://deno.land"] = true,
            },
          },
        },
        inlayHints = {
          parameterTypes = {
            enabled = true,
          },
          variableTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          functionReturnTypes = {
            enabled = true,
          },
          enumMemberValues = {
            enabled = true,
          },
          enabled = true,
        },
      },
    },
  },
  tsserver = {
    single_file_support = false,
    root_dir = lspconfig.util.root_pattern("package.json"),
  },
  eslint = {
    root_dir = lspconfig.util.root_pattern(".eslintrc*"),
  },
  vimls = {},
  bashls = {},
  cssls = {},
  nil_ls = {},
  pyright = {},
  zls = {},
}

for server, config in pairs(servers) do
  lspconfig[server].setup(config)
end

-- }}}
