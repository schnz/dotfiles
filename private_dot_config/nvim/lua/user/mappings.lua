vim.g.mapleader = ' '

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-s>', telescope.live_grep, {})

vim.keymap.set('n', '<Tab>', vim.cmd.tabn)
vim.keymap.set('n', '<S-Tab>', vim.cmd.tabp)
vim.keymap.set('n', 'n', vim.cmd.tabnew)
vim.keymap.set('n', 'c', vim.cmd.tabclose)

vim.keymap.set('n', '%', vim.cmd.vnew)
vim.keymap.set('n', '"', vim.cmd.new)

vim.keymap.set('n', '', vim.cmd.NvimTreeFocus)
