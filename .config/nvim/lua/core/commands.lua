-- User command to reload the Neovim configuration
vim.api.nvim_create_user_command('ReloadConfig', function()
  vim.cmd('source ' .. vim.env.MYVIMRC)
end, { desc = 'Reload Neovim configuration' })

-- Autocommand: Highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('custom-yank-highlight', { clear = true }),
  desc = 'Highligt on yank',
  callback = function()
    vim.hl.on_yank { higroup = 'Visual', timeout = 200 }
  end,
})

-- Autocommand: Close help and man buffers with 'q'
-- vim.api.nvim_create_autocmd('FileType', {
--   group = vim.api.nvim_create_augroup('custom-help-close', { clear = true }),
--   pattern = { 'help', 'man' },
--   desc = 'Close buffer with q in help and man',
--   callback = function()
--     vim.api.nvim_buf_set_keymap(0, 'n', 'q', '<cmd>quit<cr>', { noremap = true, silent = true })
--   end,
-- })

-- Autocommand: Auto save
-- vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'VimLeavePre' }, {
--   group = vim.api.nvim_create_augroup('custom-auto-save', { clear = true }),
--   pattern = '*',
--   callback = function(event)
--     if event.buftype or event.file == '' then
--       return
--     end
--     vim.api.nvim_buf_call(event.buf, function()
--       vim.schedule(function()
--         vim.cmd 'silent! write'
--       end)
--     end)
--   end,
-- })
