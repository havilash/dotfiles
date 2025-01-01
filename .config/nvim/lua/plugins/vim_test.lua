return {
  'vim-test/vim-test',
  enabled = not vim.g.vscode,
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.keymap.set('n', '<leader>xtn', ':TestNearest<CR>', { desc = 'E[X]ecute [T]est [N]earest' })
    vim.keymap.set('n', '<leader>xtf', ':TestFile<CR>', { desc = 'E[X]ecute [T]est [F]ile' })
    vim.keymap.set('n', '<leader>xts', ':TestSuite<CR>', { desc = 'E[X]ecute [T]est [S]uite' })
    vim.keymap.set('n', '<leader>xtl', ':TestLast<CR>', { desc = 'E[X]ecute [T]est [L]ast' })
    vim.keymap.set('n', '<leader>xtg', ':TestVisit<CR>', { desc = 'E[X]ecute [T]est [G]o to' })

    local strategy = os.getenv 'TMUX' and 'vimux' or 'basic'
    vim.cmd("let test#strategy = '" .. strategy .. "'")
  end,
}
