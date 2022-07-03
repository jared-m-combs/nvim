local lsp_installer = require 'nvim-lsp-installer'
local lsp_config = require 'lspconfig'
local util = require 'lspconfig.util'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local whichkey = require 'which-key'
local keymaps = require 'vimrc.keymaps'
local cfg = {}

lsp_installer.setup {
    ensure_installed = {
        'lua',
        'tsserver',
        'eslint',
        'pyright',
        'zls'
    },
    automatic_installation = true,
    max_concurrent_installers = 10,
}

cfg.sumneko_lua = {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    }
}

cfg.tsserver = {
    init_options = {
        hostInfo = 'neovim',
        preferences = {
            disableSuggestions = true
        }
    },
    root_dir = function(fname)
        return util.root_pattern('tsconfig.json', 'jsconfig.json')(fname)
        or util.root_pattern('package.json', '.git')(fname)
    end
}

cfg.eslint = {
    root_dir = function(fname)
        return util.root_pattern('.eslintrc', '.eslintrc.*')(fname)
        or util.root_pattern('package.json', '.git')(fname)
    end
}

cfg.pyright = {}

cfg.zls = {}

local function on_attach(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    for mode, mappings in pairs(keymaps.lsp) do
        whichkey.register(mappings, { mode = mode, buffer = bufnr })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if vim.g.autocompletion ~= 0 then
    cmp_nvim_lsp.update_capabilities(capabilities)
end

for name, options in pairs(cfg) do
    lsp_config[name].setup(vim.tbl_extend('keep', options, {
        on_attach = on_attach,
        capabilities = capabilities
    }))
end
