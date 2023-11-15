vim.opt.ignorecase = true
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- keymapping
local vscode = require("vscode-neovim")

vim.keymap.set('n', ";", ":", {})
vim.keymap.set('n', ":", ";", {})

vim.keymap.set('n', "gr", function()
  vscode.action('references-view.findReferences')
end, {})

vim.keymap.set('n', "gi", function()
  vscode.action('references-view.findImplementations')
end, {})

vim.keymap.set('n', "<leader>rn", function()
  vscode.action('editor.action.rename')
end, {})

vim.keymap.set('n', "<leader>fm", function()
  vscode.action('editor.action.formatDocument')
end, {})

vim.keymap.set('v', "<leader>fs", function()
  vscode.action('workbench.action.findInFiles')
end, {})

vim.keymap.set('n', "<leader>fs", function()
  vscode.action('workbench.action.findInFiles')
end, {})

vim.keymap.set('n', "<leader>e", function()
  vscode.action('workbench.action.toggleSidebarVisibility')
end, {})

vim.keymap.set('n', "<leader>ff", function()
  vscode.action('workbench.action.quickOpen')
end, {})
