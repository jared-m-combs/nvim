vim.g.solarized_statusline = 'flat'
vim.cmd 'packadd vim-solarized8'
vim.cmd 'runtime colors/solarized8.vim'
require('lualine').setup { options = { theme = 'solarized' } }

local colors = {
    base03  = '#002b36',
    base02  = '#073642',
    base01  = '#586e75',
    base00  = '#657b83',
    base0   = '#839496',
    base1   = '#93a1a1',
    base2   = '#eee8d5',
    base3   = '#fdf6e3',
    red     = '#dc322f',
    green   = '#859900',
    yellow  = '#b58900',
    blue    = '#268bd2',
    magenta = '#d33682',
    cyan    = '#2aa198',
    back    = '#002b36',
    orange  = '#cb4b16',
    violet  = '#6c71c4',
}

local function hi(...) vim.api.nvim_set_hl(0, ...) end

hi('LineNr', { fg = colors.base00 ,bg = colors.base03 })
hi('VertSplit', { fg = colors.base01, bg = colors.base03 })

hi('IndentBlanklineChar', { fg = colors.base02 })
hi('IndentBlanklineContextChar',  { fg = colors.base01 })
hi('IndentBlanklineContextStart', { link = 'IndentBlanklineContextChar' })

-- hi('NvimTreeFolderIcon', { fg = colors.cyan })
hi('NvimTreeIndentMarker', { fg = colors.base02 })

hi('DiagnosticError', { fg = colors.red })
hi('DiagnosticWarn', { fg = colors.yellow })
hi('DiagnosticInfo', { fg = colors.blue })
hi('DiagnosticHint', { fg = colors.cyan })
hi('DiagnosticUnderlineError', { sp = colors.red, undercurl = true })
hi('DiagnosticUnderlineWarn', { sp = colors.yellow, undercurl = true })
hi('DiagnosticUnderlineInfo', { sp = colors.blue, undercurl = true })
hi('DiagnosticUnderlineHint', { sp = colors.cyan, undercurl = true })
