return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<C-p>", "<cmd>Telescope find_files<cr>", mode = "n" },
    { "<C-s>", "<cmd>Telescope live_grep<cr>", mode = "n" }
  }
}
