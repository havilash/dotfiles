return {
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
}
