-- Fuzzy finder plugins
return {
  -- FZF integration
  {
    'junegunn/fzf',
    build = './install --bin',
    cond = vim.fn.executable('fzf') == 1,
  },

  {
    'junegunn/fzf.vim',
    dependencies = { 'junegunn/fzf' },
    cond = vim.fn.executable('fzf') == 1,
    config = function()
      -- Set up FZF keymaps
      vim.keymap.set('n', '<C-p>', ':GFiles -X .gitignore<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>ls', ':FZF<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>lb', ':Buffers<CR>', { noremap = true, silent = true })

      -- Add FZF to runtime path
      vim.opt.rtp:append('/opt/homebrew/opt/fzf')
    end,
  },

  -- CtrlP as fallback if FZF not available
  {
    'ctrlpvim/ctrlp.vim',
    cond = vim.fn.executable('fzf') == 0,
    config = function()
      vim.keymap.set('n', '<C-p>', ':CtrlP<CR>', { noremap = true, silent = true })
      vim.keymap.set('n', '<leader>lb', ':CtrlPBuffer<CR>', { noremap = true, silent = true })

      vim.g.ctrlp_clear_cache_on_exit = 0
      vim.g.ctrlp_max_files = 20000
      vim.g.ctrlp_match_window = 'max:20'
    end,
  },
}
