vim.g.mapleader = ' '

vim.keymap.set('n', '<Leader><Leader>', ':nohl<CR>')
vim.keymap.set('n', ',', ':norm A,<CR>')
vim.keymap.set('n', ';', ':norm A;<CR>')
vim.keymap.set('n', '<Leader>n', '<C-w><C-w>')
vim.keymap.set('n', '<Leader>t', ':tabnew<CR>:FzfLua files<CR>')

vim.keymap.set('n', '<Leader>z', ':norm zA<CR>')
vim.keymap.set('n', '<Leader>Z', ':norm zfi}<CR>')

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
