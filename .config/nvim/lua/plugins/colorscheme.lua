return {
  -- 'ellisonleao/gruvbox.nvim',
  -- 'folke/tokyonight.nvim',
  -- 'catppuccin/nvim',
  -- name = 'catppuccin',
  -- 'navarasu/onedark.nvim',
  -- 'AlexvZyl/nordic.nvim',
  {
    'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false

      vim.opt.background = 'dark'
    end,
    init = function()
      vim.cmd.colorscheme 'nord'
    end,
  },
}
