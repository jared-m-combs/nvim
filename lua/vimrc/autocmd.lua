local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local vimrc = augroup('vimrc', { clear = true })

-- open nvim-tree at startup
autocmd('VimEnter', {
    callback = function(data)
        if data.file and #data.file > 0 and vim.fn.isdirectory(data.file) == 0 then
            return
        end
        require("nvim-tree.api").tree.open()
    end
})

-- don't show line numbers on terminal and start in insert mode
autocmd('TermOpen', {
    group = vimrc,
    command = 'setlocal nonumber norelativenumber nobuflisted | startinsert'
})

-- close terminal immediately if no error status
autocmd('TermClose', {
    group = vimrc,
    command = "if !v:event.status | exe 'bd! '..expand('<abuf>') | endif"
})

-- don't auto comment new lines
autocmd('BufEnter', {
    group = vimrc,
    pattern = '*',
    command = 'set fo-=c fo-=r fo-=o',
})
