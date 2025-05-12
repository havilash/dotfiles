local vscode = require 'vscode'

local map = function(keys, action, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, function()
    vscode.action(action)
  end)
end

-- LSP
map('gd', 'editor.action.revealDefinition')
map('gI', 'editor.action.revealImplementation')
map('gr', 'references-view.findReferences')
map('<leader>rn', 'editor.action.rename')
map('<leader>ca', 'editor.action.quickFix')

-- Navigation
map('<C-h>', 'workbench.action.navigateLeft')
map('<C-j>', 'workbench.action.navigateDown')
map('<C-k>', 'workbench.action.navigateUp')
map('<C-l>', 'workbench.action.navigateRight')

map('<C-Left>', 'workbench.action.decreaseViewWidth')
map('<C-Right>', 'workbench.action.increaseViewWidth')
map('<C-Up>', 'workbench.action.increaseViewHeight')
map('<C-Down>', 'workbench.action.decreaseViewHeight')

map('<C-p>', 'selectPrevSuggestion')
map('<C-n>', 'selectNextSuggestion')

-- Edit
map('<leader>f', 'editor.action.formatDocument')

-- Search
map('<leader>sf', 'workbench.action.quickOpen')
map('<leader>sg', 'workbench.action.findInFiles')
map('<leader>ds', 'workbench.action.showAllSymbols')

-- Panels
map('\\', 'workbench.view.explorer')
map('<leader>g', 'workbench.view.scm')
map('<leader>x', 'workbench.view.extensions')
map('<leader>t', 'workbench.action.terminal.toggleTerminal')
map('<leader>q', 'workbench.actions.view.problems')

-- Debug
map('<leader>b', 'editor.debug.action.toggleBreakpoint')
map('<leader>B', 'editor.debug.action.conditionalBreakpoint')
