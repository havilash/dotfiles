return {
  -- 'ellisonleao/gruvbox.nvim',
  -- 'folke/tokyonight.nvim',
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  'navarasu/onedark.nvim',
  enabled = not vim.g.vscode,
  style = 'darker',
  init = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
