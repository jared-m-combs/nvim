local PACKER_GIT_REPO = 'https://github.com/wbthomason/packer.nvim'
local PACKER_PATH = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

return function(callback)
    if string.len(vim.fn.glob(PACKER_PATH)) > 0 then
        callback()
        return
    end
    vim.api.nvim_create_autocmd('User', {
        pattern = 'PackerComplete',
        callback = function(args)
            vim.api.nvim_del_autocmd(args.id)
            vim.cmd 'runtime! plugin/**/*.vim'
            vim.cmd 'runtime! plugin/**/*.lua'
            callback()
        end
    })
    vim.fn.system { 'git', 'clone', '--depth', '1', PACKER_GIT_REPO, PACKER_PATH }
    vim.cmd 'packadd packer.nvim'
    vim.cmd 'runtime lua/vimrc/plugins.lua'
    vim.cmd 'PackerSync'
end
