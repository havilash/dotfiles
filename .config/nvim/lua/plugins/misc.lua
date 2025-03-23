return {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
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
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
    },
    ft = { 'markdown', 'Avante' },
  },
}
