-- Configure color & highlighting
vim.opt.termguicolors = true
vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1
vim.cmd.colorscheme("sonokai")

-- Disable netrw (see :h netrw-noload) as adviced by nvim-tree
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- Revert some nvim defaults to vim defaults
vim.opt.mouse = ''
vim.opt.incsearch = false

-- Override options
vim.opt.list = true
vim.opt.listchars = { tab='»·', trail='·', nbsp='+' }
vim.opt.textwidth = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'number'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scroll = 1
