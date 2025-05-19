-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = 'lua',
--     callback = function (args)
--         vim.lsp.enable('lua_ls')
--     end
-- })

-- vim.api.nvim_create_autocmd('FileType', {
--     pattern = {'typescript', 'typescriptreact', 'vue', 'javascript' },
--     callback = function (args)
--         vim.opt.tabstop = 2
--         vim.opt.shiftwidth = 2

--         vim.lsp.enable('ts_ls')
--     end
-- })