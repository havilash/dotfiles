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
M.volar = {}

M.lua_ls = require 'plugins.lsp.lang.lua'
M.ts_ls = require 'plugins.lsp.lang.ts'

return M
