return {
  'vim-test/vim-test',
  enabled = not vim.g.vscode,
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.keymap.set('n', '<leader>ctn', ':TestNearest<CR>', { desc = '[C]ode [T]est [N]earest' })
    vim.keymap.set('n', '<leader>ctf', ':TestFile<CR>', { desc = '[C]ode [T]est [F]ile' })
    vim.keymap.set('n', '<leader>cts', ':TestSuite<CR>', { desc = '[C]ode [T]est [S]uite' })
    vim.keymap.set('n', '<leader>ctl', ':TestLast<CR>', { desc = '[C]ode [T]est [L]ast' })
    vim.keymap.set('n', '<leader>ctg', ':TestVisit<CR>', { desc = '[C]ode [T]est [G]o to' })

    local strategy = os.getenv 'TMUX' and 'vimux' or 'basic'
    vim.cmd("let test#strategy = '" .. strategy .. "'")
  end,
}
