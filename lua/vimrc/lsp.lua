local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'
local lsp_config = require 'lspconfig'
local util = require 'lspconfig.util'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'
local whichkey = require 'which-key'
-- local aerial = require 'aerial'
local keymaps = require 'vimrc.keymaps'
local cfg = {}

mason.setup {}

mason_lspconfig.setup {
    ensure_installed = {
        'lua_ls',
        'tsserver',
        'eslint',
        'gopls',
        'golangci_lint_ls',
        'pyright',
        'rust_analyzer',
        'zls'
    },
    automatic_installation = true,
    max_concurrent_installers = 10,
}

cfg.lua_ls = {
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

cfg.gopls = {}
cfg.golangci_lint_ls = {}
cfg.pyright = {}
cfg.rust_analyzer = {}
cfg.zls = {}

local function on_attach(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- aerial.on_attach(client, bufnr)
    for mode, mappings in pairs(keymaps.lsp) do
        whichkey.register(mappings, { mode = mode, buffer = bufnr })
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
if vim.g.autocompletion ~= 0 then
    capabilities = cmp_nvim_lsp.default_capabilities()
end

for name, options in pairs(cfg) do
    lsp_config[name].setup(vim.tbl_extend('keep', options, {
        on_attach = on_attach,
        capabilities = capabilities
    }))
end
