return {
  'vim-test/vim-test',
  enabled = not vim.g.vscode,
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.keymap.set('n', '<leader>tn', ':TestNearest<CR>', { desc = '[T]est [N]earest' })
    vim.keymap.set('n', '<leader>tf', ':TestFile<CR>', { desc = '[T]est [F]ile' })
    vim.keymap.set('n', '<leader>ts', ':TestSuite<CR>', { desc = '[T]est [S]uite' })
    vim.keymap.set('n', '<leader>tl', ':TestLast<CR>', { desc = '[T]est [L]ast' })
    vim.keymap.set('n', '<leader>tg', ':TestVisit<CR>', { desc = '[T]est [G]o to' })

    local strategy = os.getenv 'TMUX' and 'vimux' or 'basic'
    vim.cmd("let test#strategy = '" .. strategy .. "'")
  end,
}
