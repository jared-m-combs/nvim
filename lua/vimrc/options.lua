vim.g.colorscheme = 'my.gruvbox'              -- colorscheme
vim.g.mapleader = ' '                         -- the <leader> character used in mappings
vim.g.autocompletion = 1                      -- enable/disable autocompletion
vim.g.did_load_filetypes = 0                  -- disable filetype.vim
vim.g.do_filetype_lua = 1                     -- enabled filetype.lua
vim.o.shell = '/usr/bin/zsh'                  -- set the shell
vim.o.foldmethod = 'expr'                     -- fold code by evalulating an expression
vim.o.foldexpr = 'nvim_treesitter#foldexpr()' -- enable treesitter based code folding
vim.o.foldlevel = 99                          -- default files to unfolded
vim.opt.mouse = 'a'                           -- enable mouse support in all modes
vim.opt.termguicolors = true                  -- enables 24-bit RGB color
vim.opt.title = true                          -- the title of the window will be set to the value of 'titlestring'
vim.opt.clipboard = 'unnamedplus'             -- uses the clipboard register for all yank, delete, change and put operations
vim.opt.cursorline = true                     -- highlight the text line of the cursor with CursorLine
vim.opt.whichwrap:append '<>[]hl'             -- allow specified keys to wrap to previous and next lines
vim.opt.shortmess:append 'sI'                 -- modifies which messages are written to the command line
vim.opt.cmdheight = 1                         -- number of screen lines to use for the command-line
vim.opt.fillchars = {eob = ' '}               -- disable tilde characters on end of buffer
vim.opt.splitbelow = true                     -- splitting will put the new window below the current one
vim.opt.splitright = true                     -- splitting will put the new window right of the current one
vim.opt.undofile = true                       -- save undo history to file
vim.opt.timeoutlen = 400                      -- time in milleseconds to wait for a mapped sequence to complete
vim.opt.updatetime = 250                      -- number of milleseconds of no typing until the swap file is written to disk
vim.opt.laststatus = 3                        -- show the status line always and ONLY the last windows
vim.opt.showmode = false                      -- show mode on the last line
vim.opt.expandtab = true                      -- use spaces instead of tabs
vim.opt.shiftwidth = 4                        -- number of spaces to use for each indent
vim.opt.tabstop = 4                           -- number of spaces that a <Tab> in the file counts for
vim.opt.smartindent = true                    -- do smart autoindenting when starting a new line
vim.opt.ignorecase = true                     -- ignore case in search patterns
vim.opt.smartcase = true                      -- override 'ignorecase' if pattern contains upper case characters
vim.opt.number = true                         -- print the line number in front of each line
vim.opt.numberwidth = 2                       -- minimal number of columns to use for the line number
vim.opt.ruler = false                         -- show the line and column number of the cursor position
vim.opt.signcolumn = 'yes'                    -- always draw the sign column
vim.opt.completeopt = 'menu,menuone,noselect' -- options for insert mode completion

local disabled_plugins = {
    '2html_plugin',
    'getscript',
    'getscriptPlugin',
    'gzip',
    'logipat',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'matchit',
    'tar',
    'tarPlugin',
    'rrhelper',
    'spellfile_plugin',
    'vimball',
    'vimballPlugin',
    'zip',
    'zipPlugin',
    'python3_provider',
    'python_provider',
    'node_provider',
    'ruby_provider',
    'perl_provider',
    'tutor',
    'rplugin',
    'syntax',
    'synmenu',
    'optwin',
    'compiler',
    'bugreport',
    'ftplugin',
}

for _, plugin in pairs(disabled_plugins) do
    vim.g['loaded_' .. plugin] = 1
end
