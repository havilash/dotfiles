vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Clear highlights on search when pressing <Esc> in normal mode (see `:help hlsearch`)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Better indent handling
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Move text up and down
vim.keymap.set('v', 'J', ':m .+1<CR>==')
vim.keymap.set('v', 'K', ':m .-2<CR>==')
vim.keymap.set('x', 'J', ":move '>+1<CR>gv-gv")
vim.keymap.set('x', 'K', ":move '<-2<CR>gv-gv")

-- paste preserves primal yanked piece
vim.keymap.set('v', 'p', '"_dP')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Execute lua
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('custom-execute-lua', { clear = true }),
  pattern = 'lua',
  callback = function()
    vim.keymap.set('n', '<space>xf', '<CMD>source %<CR>', { desc = 'E[X]ecute [F]ile', buffer = true })
    vim.keymap.set('n', '<space>xx', '<CMD>:.lua<CR>', { desc = 'E[X]ecute [X] current line', buffer = true })
    vim.keymap.set('v', '<space>xx', ':lua<CR>', { desc = 'E[X]ecute [X] selected text', buffer = true })
  end,
})

if not vim.g.vscode then
  require 'core.keymaps.non_vscode'
else
  require 'core.keymaps.vscode'
end
