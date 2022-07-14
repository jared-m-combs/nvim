local whichkey = require 'which-key'
local keymaps = {}

whichkey.setup {
    operators = {
        gc = 'Comment',
        ys = 'Surround',
    }
}

keymaps.common = {
    n = {
        ['<ESC>'] = { '<cmd>noh<CR>', 'No highlight' },
        ['<S-Tab>'] = { '<cmd>bp<CR>', 'Previous buffer' },
        ['<Tab>'] = { '<cmd>bn<CR>', 'Next buffer' },
        g = {
            a = { '<Plug>(EasyAlign)', ' align {motion} {char}' },
        },
        ['<leader>'] = {
            b = {
                name = 'buffer',
                b = { '<cmd>enew<CR>', 'New buffer' },
                d = { '<cmd>Bd!<CR>', 'Close buffer' },
                D = { '<cmd>bd!<CR>', 'Close buffer and window.' },
                v = { '<C-w>v<cmd>enew<CR>', 'New vertical split buffer' },
                s = { '<C-w>s<cmd>enew<CR>', 'New split buffer' },
                ['#'] = { '<cmd>b#<CR>', 'Show previously selected buffer' },
                ['1'] = { '<cmd>LualineBuffersJump 1<CR>', 'Jump to buffer 1' },
                ['2'] = { '<cmd>LualineBuffersJump 2<CR>', 'Jump to buffer 2' },
                ['3'] = { '<cmd>LualineBuffersJump 3<CR>', 'Jump to buffer 3' },
                ['4'] = { '<cmd>LualineBuffersJump 4<CR>', 'Jump to buffer 4' },
                ['5'] = { '<cmd>LualineBuffersJump 5<CR>', 'Jump to buffer 5' },
                ['6'] = { '<cmd>LualineBuffersJump 6<CR>', 'Jump to buffer 6' },
                ['7'] = { '<cmd>LualineBuffersJump 7<CR>', 'Jump to buffer 7' },
                ['8'] = { '<cmd>LualineBuffersJump 8<CR>', 'Jump to buffer 8' },
                ['9'] = { '<cmd>LualineBuffersJump 9<CR>', 'Jump to buffer 9' },
                ['$'] = { '<cmd>LualineBuffersJump $<CR>', 'Jump to last buffer' },
            },
            e = {
                name = 'explore',
                e = { '<cmd>NvimTreeFocus<CR>', 'Open/Focus file tree' },
                d = { '<cmd>NvimTreeClose<CR>', 'Close file tree' },
            },
            f = {
                name = 'find',
                f = { '<cmd>Telescope find_files<CR>', 'Find files' },
                a = { '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>', 'Find all' },
                g = { '<cmd>Telescope live_grep<CR>', 'Live grep' },
                b = { '<cmd>Telescope buffers<CR>', 'Find buffers' },
                h = { '<cmd>Telescope help_tags<CR>', 'Help page' },
                o = { '<cmd>Telescope oldfiles<CR>', 'Find oldfiles' },
                k = { '<cmd>Telescope keymaps<CR>', 'Show key maps' },
                t = { '<cmd>Telescope terms<CR>', 'Pick hidden term' },
            },
            g = {
                name = 'git',
                g = { '<cmd> Telescope git_status <CR>', 'Git status' },
                c = { '<cmd> Telescope git_commits <CR>', 'Git commits' },
            },
            l = {
                name = 'line',
                n = { '<cmd>set nu!<CR>', 'Toggle line number' },
                r = { '<cmd>set rnu!<CR>', 'Toggle relative number' },
            },
            t = {
                name = 'terminal',
                t = { '<C-w>s<cmd>lcd %:p:h<CR><cmd>terminal<CR><cmd>resize 25<CR>', 'Open terminal' },
                v = { '<C-w>v<cmd>lcd %:p:h<CR><cmd>terminal<CR>', 'Open vertical split terminal' },
            },
            wk = { '<cmd>WhichKey<CR>', 'Show keymaps' },
        },
    },
    v = {
        g = {
            a = { '<Plug>(EasyAlign)', ' align {char}' },
        },
    },
    t = {
        ['<C-x>'] = {
            vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true),
            'Escape terminal mode',
        },
    }
}

keymaps.aerial = {
    n = {
        ['<leader>'] = {
            e = {
                o = { '<cmd>AerialToggle!<CR>', 'Toggle outline'}
            }
        }
    }
}

keymaps.lsp = {
    n = {
        g = {
            D = { vim.lsp.buf.declaration, 'Goto declaration' },
            d = { vim.lsp.buf.definition, 'Goto definition' },
            i = { vim.lsp.buf.implementation, 'Goto implementation' },
            t = { vim.lsp.buf.type_definition, 'Goto type definition' },
            r = { vim.lsp.buf.references, 'Find references' },
        },
        K = { vim.lsp.buf.hover, 'Open hover' },
        ['[d'] = { vim.diagnostic.goto_prev, 'Goto previous diagnostic' },
        [']d'] = { vim.diagnostic.goto_next, 'Goto next diagnostic' },
        ['<leader>'] = {
            w = {
                name = 'workspace',
                a = { vim.lsp.buf.add_workspace_folder, 'Add workspace folder' },
                r = { vim.lsp.buf.remove_workspace_folder, 'Remove workspace folder' },
                l = { function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'List workspace folders' },
            },
            r = {
                name = 'refactor',
                r = { vim.lsp.buf.code_action, 'Code action' },
                n = { vim.lsp.buf.rename, 'Rename symbol' },
                f = { vim.lsp.buf.formatting, 'Format' },
            },
            d = {
                name = 'diagnostics',
                d = { vim.diagnostic.open_float, 'Open diagnostic float' },
                q = { vim.diagnostic.setloclist, 'Set diagnostic loc list' },
            },
        },
    },
    i = {
        ['<C-Space>'] = { '<C-X><C-O>', 'Omnifunc' },
        ['<C-K>'] = { vim.lsp.buf.signature_help, 'Signature help' },
    },
}

for mode, mappings in pairs(keymaps.common) do
    whichkey.register(mappings, { mode = mode })
end

return keymaps
