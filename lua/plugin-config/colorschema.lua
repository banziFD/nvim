require("catppuccin").setup({
  flavour = "macchiato",
  dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = "light",
      percentage = 0.382, -- percentage of the shade to apply to the inactive window
  },
  integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = false,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
  },
})

vim.cmd.colorscheme "catppuccin"
