vim.g.gruvbox_bold = 0
vim.g.gruvbox_sign_column = 'bg0'
vim.g.gruvbox_invert_selection = 0
vim.cmd 'runtime colors/gruvbox.vim'
require('lualine').setup { options = { theme = 'gruvbox' } }

local function hi(...) vim.api.nvim_set_hl(0, ...) end

hi('IndentBlanklineContextChar',  { link = 'GruvboxBg4' })
hi('IndentBlanklineContextStart', { link = 'IndentBlanklineContextChar' })

hi('NvimTreeFolderIcon', { link = 'GruvboxGray' })
hi('NvimTreeIndentMarker', { link = 'GruvboxBg2' })

hi('DiagnosticError', { link = 'GruvboxRed' })
hi('DiagnosticWarn', { link = 'GruvboxYellow' })
hi('DiagnosticInfo', { link = 'GruvboxBlue' })
hi('DiagnosticHint', { link = 'GruvboxAqua' })
hi('DiagnosticUnderlineError', { link = 'GruvboxRedUnderline' })
hi('DiagnosticUnderlineWarn', { link = 'GruvboxYellowUnderline' })
hi('DiagnosticUnderlineInfo', { link = 'GruvboxBlueUnderline' })
hi('DiagnosticUnderlineHint', { link = 'GruvboxAquaUnderline' })
