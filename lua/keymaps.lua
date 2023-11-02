vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', ";", ":", {})
vim.keymap.set('n', ":", ";", {})
vim.keymap.set('n', "<Leader>d", function() 
  vim.diagnostic.open_float(0, {scope = 'line'})
end, {})


