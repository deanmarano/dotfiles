-- Colorscheme plugins
return {
  -- Your custom fireslime colorscheme
  {
    'deanmarano/fireslime.vim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd('colorscheme fireslime')
    end,
  },

  -- Solarized8 as backup
  {
    'lifepillar/vim-solarized8',
    lazy = true,
  },

  -- Flattened theme
  {
    'romainl/flattened',
    lazy = true,
  },
}
