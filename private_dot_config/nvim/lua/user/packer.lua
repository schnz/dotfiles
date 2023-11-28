local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  -- Advanced highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- Color scheme
  'sainnhe/sonokai',

  -- Advanced status bar
  'nvim-lualine/lualine.nvim',

  -- Fuzzy file finder
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- File tree
  'nvim-tree/nvim-tree.lua',

  -- Configurations for Nvim LSP
  'neovim/nvim-lspconfig',
})

