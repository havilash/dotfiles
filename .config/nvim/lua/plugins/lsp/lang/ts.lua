local npm_root = vim.fn.system('npm root -g'):gsub('%s+', '')
local vue_ts_plugin_path = npm_root .. '/@vue/typescript-plugin'

return {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_ts_plugin_path,
        languages = { 'vue' },
      },
    },
  },
}
