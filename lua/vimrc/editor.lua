local colorizer = require 'colorizer'
local gitsigns = require 'gitsigns'
local blankline = require 'indent_blankline'
local autopairs = require 'nvim-autopairs'

colorizer.setup {
    'lua'
}

gitsigns.setup {}

blankline.setup {
    indentLine_enabled = 1,
    char = '▏',
    context_char = '▏',
    filetype_exclude = {
        'help',
        'terminal',
        'alpha',
        'lspinfo',
        'TelescopePrompt',
        'TelescopeResults',
        'lsp-installer',
        '',
    },
    buftype_exclude = { 'terminal' },
    show_trailing_blankline_indent = false,
    show_current_context = true,
    show_current_context_start = false,
}

autopairs.setup {
    disable_filetype = { 'TelescopePrompt', 'vim' },
}

vim.diagnostic.config {
    virtual_text = { prefix = '' },
    signs = true,
    underline = true,
    update_in_insert = false,
}

local diagnostic_signs = {
    Error = '',
    Info  = '',
    Hint  = '',
    Warn  = '',
}

for sign, glyph in pairs(diagnostic_signs) do
    local hl = 'DiagnosticSign' .. sign
    vim.fn.sign_define(hl, { text = glyph, numhl = hl, texthl = hl })
end
