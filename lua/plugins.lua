-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { 
      {'nvim-lua/plenary.nvim'},
    },
  }

  -- treesitter
  use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})

  -- ts-rainbow
  use 'p00f/nvim-ts-rainbow'

  -- indent-blankline
  use 'lukas-reineke/indent-blankline.nvim'

  --nvim-tree
  use 'nvim-tree/nvim-tree.lua'

  --nvim-web-devicons
  use 'nvim-tree/nvim-web-devicons'

  -- lualine ui 
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  -- color theme
  use { "catppuccin/nvim", as = "catppuccin" }
  
  -- lsp
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "jayp0521/mason-null-ls.nvim",
    "neovim/nvim-lspconfig",
    'jose-elias-alvarez/null-ls.nvim',
  }

  -- autocompletion
  use {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "L3MON4D3/LuaSnip",
  }

  -- comment
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use({
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  })

end)
