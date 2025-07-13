-- Extend default capabilities with nvim-cmp support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

local servers = require 'plugins.lsp.lang'

-- Setup Mason and installer
require('mason').setup()

local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, { 'stylua', 'markdownlint' })
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

for server_name, server in pairs(servers) do
  vim.lsp.config(server_name, server)
end

require('mason-lspconfig').setup {
  ensure_installed = {},
  automatic_enable = vim.tbl_keys(servers or {}),
}
