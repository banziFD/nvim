require("telescope").setup {
  defaults = {
    wrap_results = true,
    sorting_strategy = "ascending",
    preview = {
      hide_on_startup = false,
    },

    layout_config = {
      prompt_position = 'top',
      preview_width = 0.618,
    },
    dynamic_preview_title = true,
    mappings = {
      n = {
        ['<leader>p'] = require('telescope.actions.layout').toggle_preview,
      },
      i = {
        ['<leader>p'] = require('telescope.actions.layout').toggle_preview,
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

vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function(args)
    vim.wo.number = true
    vim.wo.wrap = true
  end,
})


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
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('v', '<leader>fs', function()
  local text = getVisualSelection()
  builtin.live_grep({ default_text = text })
end, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
