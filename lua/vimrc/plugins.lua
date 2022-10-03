vim.cmd 'packadd packer.nvim'

require('packer').startup({{
    'tpope/vim-commentary',                -- toggle comments
    'tpope/vim-surround',                  -- toggle quotes, brackets, parens
    'tpope/vim-fugitive',                  -- git commands
    'tpope/vim-repeat',                    -- dot repeating for tpope plugins
    'justinmk/vim-sneak',                  -- jump to a location with two characters
    'junegunn/vim-easy-align',             -- vertical alignment tool
    'moll/vim-bbye',                       -- delete buffer but not window
    'norcalli/nvim-colorizer.lua',         -- colorize hex codes
    'lukas-reineke/indent-blankline.nvim', -- indentation indicators
    'lewis6991/gitsigns.nvim',             -- highlight git changes in gutter
    'windwp/nvim-autopairs',               -- auto pairs quotes and brackets
    'kyazdani42/nvim-web-devicons',        -- color devicons
    'kyazdani42/nvim-tree.lua',            -- file tree
    'nvim-lualine/lualine.nvim',           -- statusline
    'nvim-lua/plenary.nvim',               -- utility library
    'nvim-telescope/telescope.nvim',       -- search functions
    'stevearc/aerial.nvim',                -- code outline window
    'williamboman/nvim-lsp-installer',     -- install language servers
    'neovim/nvim-lspconfig',               -- config language servers
    'hrsh7th/nvim-cmp',                    -- autocompletion
    'hrsh7th/cmp-nvim-lsp',                -- lsp completion source
    'hrsh7th/cmp-nvim-lsp-signature-help', -- signature help completion source
    'hrsh7th/cmp-buffer',                  -- buffer completion source
    'hrsh7th/cmp-path',                    -- path completion source
    'hrsh7th/cmp-cmdline',                 -- command completion source
    'L3MON4D3/LuaSnip',                    -- snippet engine
    'folke/which-key.nvim',                -- key mappings

    -- syntax analysis
    { 'nvim-treesitter/nvim-treesitter', run = ':silent! TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },

    -- colorschemes
    { 'gruvbox-community/gruvbox', opt = true },
    { 'folke/tokyonight.nvim',     opt = true },
    { 'joshdick/onedark.vim',      opt = true },
    { 'lifepillar/vim-solarized8', opt = true },
    { 'catppuccin/nvim',           opt = true, as = 'catppuccin.nvim' },

    -- markdown live preview 
    {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    },

    -- package manager
    {
        'wbthomason/packer.nvim',
        opt = true,
        cmd = {
            'PackerSnapshot',
            'PackerSnapshotRollback',
            'PackerSnapshotDelete',
            'PackerInstall',
            'PackerUpdate',
            'PackerSync',
            'PackerClean',
            'PackerCompile',
            'PackerStatus',
            'PackerProfile',
            'PackerLoad',
        },
        config = function()
            require 'vimrc.plugins'
        end
    },
}})
