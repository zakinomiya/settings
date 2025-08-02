-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  "gopls",
  "zls",
  -- "clangd",
  "rust_analyzer",
  "ts_ls",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig["rust_analyzer"].setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true;
      }
    }
  }
}
