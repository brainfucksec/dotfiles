-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README
--- neovim-lua/README.md
--- https://github.com/brainfucksec/neovim-lua#readme

local cmd = vim.cmd
cmd [[packadd packer.nvim]]

local packer = require 'packer'

-- Add packages
return packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- file explorer
  use 'kyazdani42/nvim-tree.lua'

  -- indent line
  use "lukas-reineke/indent-blankline.nvim"

  -- autopair
  use 'windwp/nvim-autopairs'

  -- icons
  use 'kyazdani42/nvim-web-devicons'

  -- tagviewer
  use 'liuchengxu/vista.vim'

  -- treesitter interface
  use 'nvim-treesitter/nvim-treesitter'

  -- colorscheme
  --use 'tanvirtin/monokai.nvim'
  use 'navarasu/onedark.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'

  -- autocomplete
  use { 'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  -- statusline
  use { 'famiu/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- git labels
  use { 'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
  }
end)
