return {
  -- 'ellisonleao/gruvbox.nvim',
  -- 'folke/tokyonight.nvim',
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  'navarasu/onedark.nvim',
  style = 'darker',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'onedark'
  end,
}
