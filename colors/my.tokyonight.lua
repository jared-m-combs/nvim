vim.cmd 'packadd tokyonight.nvim'
vim.cmd 'runtime colors/tokyonight.vim'
require('lualine').setup { options = { theme = 'tokyonight' } }
