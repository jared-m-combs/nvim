local nvimtree = require 'nvim-tree'
local lualine = require 'lualine'
local telescope = require 'telescope'
local aerial = require 'aerial'
local whichkey = require 'which-key'
local keymaps = require 'vimrc.keymaps'

vim.cmd('colorscheme '..vim.g.colorscheme)

nvimtree.setup {
    hijack_cursor = true,
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        hide_root_folder = true,
        width = 35,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
        highlight_git = false,
        icons = {
            show = {
                git = false,
            },
        },
    },
    filesystem_watchers = {
        enable = true
    },
    git = {
        enable = true,
        ignore = false
    },
    filters = {
        custom = { '^\\.git' }
    }
}

lualine.setup {
    options = {
        icons_enabled = true,
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff' },
        lualine_x = {
            { 'diagnostics' },
            { 'lspstatus' },
            { 'filetype', colored = false },
            { 'encoding' },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
    },
    tabline = {
        lualine_a = {
            { '""', color = 'lualine_a_normal', separator = { right = '' } },
        },
        lualine_b = {
            {
                'buffers',
                mode = 2,
                symbols = { alternate_file = '' },
                filetype_names = {
                    NvimTree = ' '
                }
            }
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            { 'tabs', color = 'lualine_a_normal' },
        },
    },
    extensions = {}
}

telescope.setup {}

aerial.setup {
    default_direction = 'left',
    on_attach = function(bufnr)
        for mode, mappings in pairs(keymaps.aerial) do
            whichkey.register(mappings, { mode = mode, buffer = bufnr })
        end
    end
}
