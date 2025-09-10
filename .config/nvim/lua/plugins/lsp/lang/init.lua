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
M.hyprls = {}
M.vue_ls = {}
M.jsonls = {}
M.sqls = {}

M.vtsls = require 'plugins.lsp.lang.vts'
M.lua_ls = require 'plugins.lsp.lang.lua'

return M
