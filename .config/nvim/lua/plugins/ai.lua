return {
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  --   dependencies = {
  --     'zbirenbaum/copilot.lua',
  --   },
  -- },
  --
  -- {
  --   'zbirenbaum/copilot.lua',
  --   event = 'InsertEnter',
  --   cmd = 'Copilot',
  --   config = function()
  --     require('copilot').setup {
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     }
  --   end,
  -- },
  -- {
  --   'CopilotC-Nvim/CopilotChat.nvim',
  --   lazy = true,
  --   event = 'VeryLazy',
  --   version = '*',
  --   dependencies = {
  --     { 'zbirenbaum/copilot.lua' },
  --     { 'nvim-lua/plenary.nvim' },
  --   },
  --   opts = {
  --     model = 'gpt-4o', -- claude-3.5-sonnet
  --   },
  --   keys = {
  --     {
  --       '<leader>aC',
  --       '<cmd>CopilotChatToggle<CR>',
  --       desc = 'Copilot Chat',
  --     },
  --   },
  -- },
  {
    'yetone/avante.nvim',
    event = 'VeryLazy',
    opts = {
      provider = 'openai',
      openai = {
        endpoint = 'https://api.openai.com/v1',
        model = 'gpt-4o',
      },
    },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      -- 'echasnovski/mini.pick',
      -- 'nvim-telescope/telescope.nvim',
      -- 'hrsh7th/nvim-cmp',
      -- 'ibhagwan/fzf-lua',
      -- 'nvim-tree/nvim-web-devicons',
      -- 'zbirenbaum/copilot.lua',
      -- 'MeanderingProgrammer/render-markdown.nvim',
      -- {
      --   'HakonHarnes/img-clip.nvim',
      --   event = 'VeryLazy',
      --   opts = {
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
    },
  },
  -- {
  --   'monkoose/neocodeium',
  --   -- event = 'VeryLazy',
  --   config = function()
  --     local neocodeium = require 'neocodeium'
  --     neocodeium.setup {
  --       manual = true, -- recommended to not conflict with nvim-cmp
  --     }
  --
  --     -- create an autocommand which closes cmp when ai completions are displayed
  --     vim.api.nvim_create_autocmd('User', {
  --       pattern = 'NeoCodeiumCompletionDisplayed',
  --       callback = function()
  --         require('cmp').abort()
  --       end,
  --     })
  --
  --     -- set up some sort of keymap to cycle and complete to trigger completion
  --     vim.keymap.set('i', '<A-e>', function()
  --       neocodeium.cycle_or_complete()
  --     end)
  --     asdf
  --     -- make sure to have a mapping to accept a completion
  --     vim.keymap.set('i', '<A-f>', function()
  --       neocodeium.accept()
  --     end)
  --   end,
  -- },
}
