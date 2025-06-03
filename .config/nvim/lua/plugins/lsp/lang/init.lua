local M = {}

M.pyright = {}
M.asm_lsp = {}
M.tailwindcss = {}
M.emmet_language_server = {}
M.eslint = {}
M.bashls = {}
M.csharp_ls = {}
M.html = {}
M.cssls = {}
M.css_variables = {}
M.vue_ls = {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}

M.lua_ls = require 'plugins.lsp.lang.lua'
-- M.ts_ls = require 'plugins.lsp.lang.ts'

return M
