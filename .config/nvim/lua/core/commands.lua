-- Create a group for user commands and autocommands
local user_group = vim.api.nvim_create_augroup('UserCommands', { clear = true })

-- User command to reload the Neovim configuration
vim.api.nvim_create_user_command('ReloadConfig', function()
  vim.cmd('source ' .. vim.env.MYVIMRC)
end, { desc = 'Reload Neovim configuration' })

-- Autocommand: Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = user_group,
  desc = 'Highligt on yank',
  callback = function()
    vim.highlight.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

-- Autocommand: Close help and man buffers with 'q'
vim.api.nvim_create_autocmd('FileType', {
  group = user_group,
  pattern = { 'help', 'man' },
  desc = 'Close buffer with q in help and man',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true })
  end,
})
