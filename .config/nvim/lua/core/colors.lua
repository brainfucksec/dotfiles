-----------------------------------------------------------
-- Color schemes configuration file
-----------------------------------------------------------

-- Import color scheme with:
--- require('colors').colorscheme_name

local M = {}

-- Theme: Monokai (classic)
--- See: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
M.monokai = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  purple = '#ae81ff',
  red = '#e95678',
}

-- Theme: Rosé Pine (main)
--- See: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
--- color names are adapted to the format above
M.rose_pine = {
  bg = '#111019', --default: #191724
  fg = '#e0def4',
  gray = '#908caa',
  pink = '#eb6f92',
  green = '#9ccfd8',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  purple = '#c4a7e7',
  red = '#ebbcba',
}

return M
