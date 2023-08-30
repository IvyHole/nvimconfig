-- 以下为coc快捷键配置
local keyset = vim.keymap.set
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- tab 补全
local coc_opts1 = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', coc_opts1)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- 回车格式化代码
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], coc_opts1)

-- Ctrl-j 代码片段， ctrl+space确定
keyset("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- GoTo 导航
keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keyset("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Remap keys for apply refactor code actions.
keyset("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
keyset("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
keyset("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
local coc_opts2 = {silent = true, nowait = true}
-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset("x", "if", "<Plug>(coc-funcobj-i)", coc_opts2)
keyset("o", "if", "<Plug>(coc-funcobj-i)", coc_opts2)
keyset("x", "af", "<Plug>(coc-funcobj-a)", coc_opts2)
keyset("o", "af", "<Plug>(coc-funcobj-a)", coc_opts2)
keyset("x", "ic", "<Plug>(coc-classobj-i)", coc_opts2)
keyset("o", "ic", "<Plug>(coc-classobj-i)", coc_opts2)
keyset("x", "ac", "<Plug>(coc-classobj-a)", coc_opts2)
keyset("o", "ac", "<Plug>(coc-classobj-a)", coc_opts2)

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local coc_opts3 = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", coc_opts3)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", coc_opts3)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", coc_opts3)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", coc_opts3)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", coc_opts3)
-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", coc_opts3)
