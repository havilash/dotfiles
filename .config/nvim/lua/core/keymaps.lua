vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
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
    vim.keymap.set('n', '<space>xf', '<cmd>source %<CR>', { desc = 'E[X]ecute [F]ile', buffer = true })
    vim.keymap.set('n', '<space>xx', '<cmd>:.lua<CR>', { desc = 'E[X]ecute [X] current line', buffer = true })
    vim.keymap.set('v', '<space>xx', '<cmd>:lua<CR>', { desc = 'E[X]ecute [X] selected text', buffer = true })
  end,
})

if vim.g.vscode then
  -- VSCode keymaps
  --
  -- general keymaps
  -- vim.keymap.set({ 'n', 'v' }, '<leader>t', vscode.action('workbench.action.terminal.toggleTerminal'))
  local vscode = require 'vscode'
  vim.keymap.set('n', '<leader>b', vscode.toggleBreakpoint)
  vim.keymap.set('n', '<leader>B', vscode.action 'editor.debug.action.conditionalBreakpoint')
  -- vim.keymap.set({ 'n', 'v' }, '<leader>d', vscode.action('editor.action.showHover'))
  vim.keymap.set('n', '<leader>ca', vscode.action 'editor.action.quickFix')
  -- vim.keymap.set({ 'n', 'v' }, '<leader>sp', vscode.action('workbench.actions.view.problems'))
  -- vim.keymap.set({ 'n', 'v' }, '<leader>cn', vscode.action('notifications.clearAll'))
  -- vim.keymap.set({ 'n', 'v' }, '<leader>ff', vscode.action('workbench.action.quickOpen'))
  -- vim.keymap.set({ 'n', 'v' }, '<leader>cp', vscode.action('workbench.action.showCommands'))
  -- vim.keymap.set({ 'n', 'v' }, '<leader>pr', vscode.action('code-runner.run'))
  vim.keymap.set({ 'n', 'v' }, '<leader>f', vscode.action 'editor.action.formatDocument')
else
  -- Non VSCode keymaps
  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- TIP: Disable arrow keys in normal mode
  vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
  vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
  vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
  vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

  -- Keybinds to make split navigation easier.
  --  Use CTRL+<hjkl> to switch between windows
  --
  --  See `:help wincmd` for a list of all window commands
  vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- Resize windows
  vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
  vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
  vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })
  vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
end
