local cocnvim = {
    'neoclide/coc.nvim',
    dependencies ={
    },
    config = function()
        -- Some servers have issues with backup files, see #649
        vim.opt.backup = false
        vim.opt.writebackup = false
        -- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
        -- delays and poor user experience
        vim.opt.updatetime = 300

        -- keymap 详见keymap配置
    end
}
return cocnvim
