--[[

  ██╗███╗   ██╗██╗████████╗██╗     ██╗   ██╗ █████╗
  ██║████╗  ██║██║╚══██╔══╝██║     ██║   ██║██╔══██╗
  ██║██╔██╗ ██║██║   ██║   ██║     ██║   ██║███████║
  ██║██║╚██╗██║██║   ██║   ██║     ██║   ██║██╔══██║
  ██║██║ ╚████║██║   ██║██╗███████╗╚██████╔╝██║  ██║
  ╚═╝╚═╝  ╚═══╝╚═╝   ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝

Neovim init file

Version: 0.12.0_alpha - 2021/09/06
Maintainer: Brainf+ck
Website: https://github.com/brainfucksec/neovim-lua

--]]

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require('settings')                 -- settings
require('keymaps')                  -- keymaps
require('plugins/paq-nvim')         -- plugin manager
require('plugins/nvim-tree')	      -- file manager
require('plugins/lualine')          -- statusline
require('plugins/nvim-cmp')         -- autocomplete
require('plugins/nvim-lspconfig')   -- LSP settings
require('plugins/vista')            -- tag viewer
require('plugins/nvim-treesitter')  -- tree-sitter interface
