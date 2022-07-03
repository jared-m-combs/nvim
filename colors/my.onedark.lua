vim.cmd 'packadd onedark.vim'
vim.cmd 'runtime colors/onedark.vim'
require('lualine').setup { options = { theme = 'onedark' } }

local colors = {
    black        = '#282c34',
    white        = '#abb2bf',
    light_red    = '#e06c75',
    dark_red     = '#be5046',
    green        = '#98c379',
    light_yellow = '#e5c07b',
    dark_yellow  = '#d19a66',
    blue         = '#61afef',
    magenta      = '#c678dd',
    cyan         = '#56b6c2',
    gutter_grey  = '#4b5263',
    comment_grey = '#5c6370',
}

local function hi(...) vim.api.nvim_set_hl(0, ...) end

hi('IndentBlanklineChar', { fg = colors.gutter_grey })
hi('IndentBlanklineContextChar',  { fg = colors.comment_grey })
hi('IndentBlanklineContextStart', { link = 'IndentBlanklineContextChar' })

hi('NvimTreeFolderIcon', { fg = colors.white })
hi('NvimTreeIndentMarker', { fg = colors.gutter_grey })

hi('DiagnosticError', { fg = colors.light_red })
hi('DiagnosticWarn', { fg = colors.light_yellow })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.cyan })
hi('DiagnosticUnderlineError', { sp = colors.light_red, undercurl = true })
hi('DiagnosticUnderlineWarn', { sp = colors.light_yellow, undercurl = true })
hi('DiagnosticUnderlineInfo', { sp = colors.blue, undercurl = true })
hi('DiagnosticUnderlineHint', { sp = colors.cyan, undercurl = true })
