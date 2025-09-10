return {
  --     'stevearc/dressing.nvim',
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- TODO: See alternative NMAC427/guess-indent.nvim
  {
    'folke/todo-comments.nvim',
    enabled = not vim.g.vscode,
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    enabled = not vim.g.vscode,
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'chentoast/marks.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'vigoux/notifier.nvim',
    opts = {},
  },

  -- {
  --   'folke/persistence.nvim',
  --   event = 'BufReadPre',
  --   opts = {},
  -- },
}
