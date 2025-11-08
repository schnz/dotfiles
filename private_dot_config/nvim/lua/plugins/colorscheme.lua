return {
  {
    "sainnhe/sonokai",
    lazy = false, -- make sure to load this during startup because it's the main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme sonokai]])
    end,
  }
}
