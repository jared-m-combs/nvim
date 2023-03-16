local LAZY_GIT_REPO = 'https://github.com/folke/lazy.nvim.git'
local LAZY_PATH = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

return function(callback)
    vim.opt.rtp:prepend(LAZY_PATH)

    if vim.loop.fs_stat(LAZY_PATH) then
        callback()
        return
    end

    vim.api.nvim_create_autocmd('User', {
        pattern = 'LazySync',
        callback = function(args)
            vim.api.nvim_del_autocmd(args.id)
            -- vim.cmd 'runtime! plugin/**/*.vim'
            -- vim.cmd 'runtime! plugin/**/*.lua'
            callback()
        end
    })

    vim.fn.system { 'git', 'clone', '--filter=blob:none', '--depth', '1', LAZY_GIT_REPO, '--branch=stable', LAZY_PATH }
    require('vimrc.plugins')
    -- vim.cmd 'Lazy sync'
end
