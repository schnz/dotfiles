vim.keymap.set('n', '<C-a><Tab>', vim.cmd.tabn)
vim.keymap.set('n', '<C-a><S-Tab>', vim.cmd.tabp)
vim.keymap.set('n', '<C-a>n', vim.cmd.tabnew)
vim.keymap.set('n', '<C-a>c', vim.cmd.tabclose)

vim.keymap.set('n', '<C-w>%', vim.cmd.vnew)
vim.keymap.set('n', '<C-w>"', vim.cmd.new)
