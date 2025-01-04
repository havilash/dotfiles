local vscode = require 'vscode'

local map = function(keys, action, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, function()
    vscode.action(action)
  end)
end

-- vim.keymap.set({ 'n', 'v' }, '<leader>t', vscode.action('workbench.action.terminal.toggleTerminal'))
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', vscode.action('editor.action.showHover'))
-- vim.keymap.set({ 'n', 'v' }, '<leader>cn', vscode.action('notifications.clearAll'))
-- vim.keymap.set({ 'n', 'v' }, '<leader>pr', vscode.action('code-runner.run'))

-- LSP actions
map('gd', 'editor.action.revealDefinition')

map('gr', 'references-view.findReferences')

map('gI', 'editor.action.revealImplementation')

map('<leader>D', 'editor.action.goToTypeDefinition')

map('<leader>ds', 'workbench.action.showAllSymbols')

map('<leader>rn', 'editor.action.rename')

map('gD', 'editor.action.revealDeclaration')

-- General Keymaps
map('<leader>q', 'workbench.actions.view.problems')

map('<leader>sf', 'workbench.action.quickOpen')

map('<leader>sc', 'workbench.action.showCommands')

map('<leader>b', 'editor.debug.action.toggleBreakpoint')

map('<leader>B', 'editor.debug.action.conditionalBreakpoint')

map('<leader>ca', 'editor.action.quickFix')

map('<leader>f', 'editor.action.formatDocument')

-- Navigation Keymaps
-- NOTE: May require additional configuration in VSCode
map('<C-h>', 'workbench.action.navigateLeft')

map('<C-l>', 'workbench.action.navigateRight')

map('<C-k>', 'workbench.action.navigateUp')

map('<C-j>', 'workbench.action.navigateDown')

-- Suggestion Navigation
-- NOTE: May require additional configuration in VSCode
map('<C-p>', 'selectPrevSuggestion')

map('<C-n>', 'selectNextSuggestion')
