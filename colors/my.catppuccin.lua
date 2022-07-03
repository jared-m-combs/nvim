vim.cmd 'packadd catppuccin.nvim'
vim.cmd 'runtime colors/catppuccin.vim'
require('lualine').setup { options = { theme = 'catppuccin' } }
