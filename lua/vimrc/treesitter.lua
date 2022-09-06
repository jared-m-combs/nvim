local treesitter = require 'nvim-treesitter.configs'

treesitter.setup {
    ensure_installed = {
        'c',
        'cpp',
        'go',
        'lua',
        'javascript',
        'jsdoc',
        'make',
        'python',
        'yaml',
        'rust',
        'zig'
    },
    highlight = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['am'] = '@function.outer',
                ['im'] = '@function.inner',
                ['ac'] = '@class.outer',
                ['ic'] = '@class.inner',
                ['al'] = '@loop.outer',
                ['il'] = '@loop.inner',
                ['ap'] = '@parameter.outer',
                ['ip'] = '@parameter.inner',
                ['ab'] = '@block.outer',
                ['ib'] = '@block.inner',
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']c'] = '@class.outer',
                [']l'] = '@loop.outer',
                [']p'] = '@parameter.outer',
                [']b'] = '@block.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']C'] = '@class.outer',
                [']L'] = '@loop.outer',
                [']P'] = '@parameter.outer',
                [']B'] = '@block.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[c'] = '@class.outer',
                ['[l'] = '@loop.outer',
                ['[p'] = '@parameter.outer',
                ['[b'] = '@block.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[C'] = '@class.outer',
                ['[L'] = '@loop.outer',
                ['[P'] = '@parameter.outer',
                ['[B'] = '@block.outer',
            },
        },
    }
}

