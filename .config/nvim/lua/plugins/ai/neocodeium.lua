return {
  'monkoose/neocodeium',
  event = 'VeryLazy',
  enabled = not vim.g.vscode,
  config = function()
    local neocodeium = require 'neocodeium'
    neocodeium.setup {
      manual = true,
    }

    vim.api.nvim_create_autocmd('User', {
      pattern = 'NeoCodeiumCompletionDisplayed',
      callback = function()
        require('cmp').abort()
      end,
    })

    vim.keymap.set('i', '<A-e>', neocodeium.cycle_or_complete, { desc = '[A]i [C]ycle Completion' })
    vim.keymap.set('i', '<A-f>', neocodeium.accept, { desc = '[A]i Accept Completion' })
  end,
}
