vim.opt.ignorecase = true
vim.opt.clipboard:append("unnamedplus")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- keymapping
local vscode = require("vscode-neovim")
local sys = vim.loop.os_uname().sysname

vim.keymap.set('n', ";", ":", {})
vim.keymap.set('n', ":", ";", {})

vim.keymap.set('n', "gr", function()
  vscode.notify('references-view.findReferences')
end, {})

vim.keymap.set('n', "gi", function()
  vscode.notify('references-view.findImplementations')
end, {})

vim.keymap.set('n', "<leader>rn", function()
  vscode.notify('editor.action.rename')
end, {})

vim.keymap.set('n', "<leader>fm", function()
  vscode.notify('editor.action.format')
end, {})

-- vim.keymap.set('i', "<c-j>", function()
--   vscode.notify('workbench.action.togglePanel')
-- end,{})
-- vim.keymap.set('n', "<c-j>", function()
--   vscode.notify('workbench.action.togglePanel')
-- end,{})
--
