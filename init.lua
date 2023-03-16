require 'vimrc.options'
require('vimrc.bootstrap')(function ()
    require 'vimrc.plugins'
    require 'vimrc.autocmd'
    require 'vimrc.keymaps'
    require 'vimrc.treesitter'
    require 'vimrc.editor'
    require 'vimrc.ui'
    require 'vimrc.lsp'
    require 'vimrc.cmp'
end)
