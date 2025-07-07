vim.g.mapleader = ' '

-- Basics
vim.keymap.set('n', '<Leader><Leader>', ':nohl<CR>')
vim.keymap.set('n', ',', ':norm A,<CR>')
vim.keymap.set('n', ';', ':norm A;<CR>')
vim.keymap.set('n', '<Leader>n', '<C-w><C-w>')
vim.keymap.set('n', '<Leader>t', ':tabnew<CR>:FzfLua files<CR>')

-- AI Gemini integration
vim.keymap.set('n', '<Leader>G', ':vert terminal gemini<CR>')

-- Folds
vim.keymap.set('n', '<Leader>z', ':norm za<CR>')
vim.keymap.set('n', '<Leader>Z', ':norm zfi}<CR>')

-- Split
vim.keymap.set('n', '<Leader>v', ':vsplit<CR>')
vim.keymap.set('n', '<Leader>h', ':split<CR>')
vim.keymap.set('n', '<Leader>s', ':split<CR>')

-- FZF
vim.keymap.set('n', '<Leader>e', ':FzfLua files<CR>')
vim.keymap.set('n', '<Leader>F', ':FzfLua live_grep_native<CR>')
vim.keymap.set('n', '<Leader>f', ':FzfLua grep_cword<CR>')
vim.keymap.set('n', '<Leader>gb', ':FzfLua git_branches<CR>')
vim.keymap.set('n', '<Leader>gs', ':FzfLua git_status<CR>')

-- LSP
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
