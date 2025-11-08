vim.g.mapleader = ' '
vim.g.maplocalleader = "\\"

vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1

-- Override options
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = { tab='»·', trail='·', nbsp='+' }
vim.opt.textwidth = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scroll = 1

-- Revert some nvim defaults to vim defaults
vim.opt.mouse = ''
vim.opt.incsearch = false
