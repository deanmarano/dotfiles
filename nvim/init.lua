-- Neovim configuration
-- Modern rewrite of ~/.vimrc

-- Set leader key early
vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Load basic settings
require('config.options')
require('config.keymaps')

-- Load custom configurations
require('config.git-grep')
require('config.projectionist')
require('config.wiki')

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup('plugins', {
  change_detection = {
    notify = false, -- Don't notify on config changes
  },
})
