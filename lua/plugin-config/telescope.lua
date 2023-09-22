require("telescope").setup {
  defaults = {
    wrap_results = true,
    sorting_strategy = "ascending",
    preview = {
      hide_on_startup = false,
    },
    dynamic_preview_title = true,
    mappings = {
      n = {
        ['<c-p>'] = require('telescope.actions.layout').toggle_preview,
      },
      i = {
        ['<c-p>'] = require('telescope.actions.layout').toggle_preview,
      },
    },
  },
  pickers = {
    lsp_references = {
      show_line = false,
    },
    lsp_implementations = {
      show_line = false,
    }
  }
}


local getVisualSelection = function()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')

  text = string.gsub(text, "\n", "")
  
  if #text > 0 then
    return text
  else
    return ''
  end
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fg', function()
  local text = getVisualSelection()
  builtin.live_grep({ default_text = text })
end, {})

vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

