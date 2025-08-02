return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  event = {
    'BufReadPre ' .. vim.fn.expand '~' .. '/notes',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/notes',
      },
    },
  },
}
