-- Utility plugins
return {
  -- Quickfix enhancements
  {
    'romainl/vim-qf',
  },

  -- QFEnter (open quickfix items in different ways)
  {
    'yssl/QFEnter',
    config = function()
      vim.g.qfenter_keymap = {
        vopen = { '<C-v>' },
        hopen = { '<C-CR>', '<C-s>', '<C-x>' },
        topen = { '<C-t>' },
      }
      vim.g.qfenter_exclude_filetypes = { 'nerdtree' }
    end,
  },

  -- BufOnly (close all buffers except current)
  {
    'vim-scripts/BufOnly.vim',
  },

  -- Fold license headers
  {
    'deanmarano/fold_license',
  },

  -- WakaTime (time tracking)
  {
    'wakatime/vim-wakatime',
  },
}
