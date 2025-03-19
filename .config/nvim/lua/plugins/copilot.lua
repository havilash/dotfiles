return {
  {
    'zbirenbaum/copilot-cmp',
    enabled = not vim.g.vscode,
    event = 'InsertEnter',
    config = function()
      require('copilot_cmp').setup()
    end,
    dependencies = {
      'zbirenbaum/copilot.lua',
    },
  },

  {
    'zbirenbaum/copilot.lua',
    enabled = not vim.g.vscode,
    event = 'InsertEnter',
    cmd = 'Copilot',
    config = function()
      require('copilot').setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = not vim.g.vscode,
    lazy = true,
    event = 'VeryLazy',
    version = '*',
    dependencies = {
      { 'zbirenbaum/copilot.lua' },
      { 'nvim-lua/plenary.nvim' },
    },
    opts = {
      model = 'gpt-4o', -- claude-3.5-sonnet
    },
    keys = {
      {
        '<leader>aC',
        '<cmd>CopilotChatToggle<CR>',
        desc = 'Copilot Chat',
      },
    },
  },
}
