-- Options / Settings
-- Migrated from .vimrc and janus-settings.vim

local opt = vim.opt

-- Shell
opt.shell = 'bash'

-- Clipboard
opt.clipboard = 'unnamedplus' -- Use system clipboard (modernized from 'unnamed')

-- Auto-reload files changed outside vim
opt.autoread = true

-- Line numbers
opt.number = true

-- Tabs and whitespace
opt.expandtab = true        -- Use spaces, not tabs
opt.tabstop = 2             -- A tab is two spaces
opt.shiftwidth = 2          -- An autoindent (with <<) is two spaces
opt.softtabstop = 2

-- Wrapping
opt.wrap = false            -- Don't wrap lines by default
opt.linebreak = true        -- When wrapping, break at word boundaries

-- List characters (show invisible characters)
opt.list = true
if vim.fn.has('unix') == 1 and (vim.o.termencoding == 'utf-8' or vim.o.encoding == 'utf-8') then
  opt.listchars = { tab = '⇥ ', trail = '·', precedes = '«', extends = '»', nbsp = '·' }
end
opt.encoding = 'utf-8'

-- Search
opt.hlsearch = true         -- Highlight matches
opt.ignorecase = true       -- Searches are case insensitive...
opt.smartcase = true        -- ...unless they contain uppercase

-- Wild menu (completion)
opt.wildignore = {
  '*.o', '*.out', '*.obj', '.git', '*.rbc', '*.rbo', '*.class', '.svn', '*.gem',
  '*.zip', '*.tar.gz', '*.tar.bz2', '*.rar', '*.tar.xz',
  '*.js.map',
  '*/.bundle/*', '*/.sass-cache/*',
  '*/node_modules/*',
  '*/tmp/*', '*.swp', '*~', '._*', '*/dist/*', '*/coverage/*',
  '*/_site/*',
  '*.pyc',
}

-- Backup and swap files
-- Use separate directories for Neovim to avoid conflicts with Vim
local cache_dir = vim.fn.expand('~/.cache/nvim')
vim.fn.mkdir(cache_dir .. '/backup', 'p')
vim.fn.mkdir(cache_dir .. '/swap', 'p')
vim.fn.mkdir(cache_dir .. '/undo', 'p')
opt.backupdir = cache_dir .. '/backup//'
opt.directory = cache_dir .. '/swap//'
opt.undodir = cache_dir .. '/undo//'
opt.undofile = true
opt.backupskip = { '/tmp/*', '/private/tmp/*' }

-- History
opt.history = 10000

-- Mouse support
opt.mouse = 'a'

-- Always show tabline
opt.showtabline = 2

-- Always show status line
opt.laststatus = 2

-- Statusline colors - match your old Vim colors
-- Soft yellow background (#b2a34e) with reddish brown text (#55352a)
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#55352a', bg = '#b2a34e', bold = true })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#55352a', bg = '#a09040' }) -- Slightly darker yellow when inactive
    vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#ccbb59', bg = '#350e01', bold = true })
    vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#ccbb59', bg = '#350e01', bold = true })
    vim.api.nvim_set_hl(0, 'Question', { fg = '#ccbb59', bg = '#350e01', bold = true })
    vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = '#350e01', bg = '#a09040' })
  end,
})

-- Apply immediately
vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#55352a', bg = '#b2a34e', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#55352a', bg = '#a09040' })

-- Command line and mode message colors - yellow text on dark brown background (matches active tab)
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#ccbb59', bg = '#350e01', bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#ccbb59', bg = '#350e01', bold = true })
vim.api.nvim_set_hl(0, 'Question', { fg = '#ccbb59', bg = '#350e01', bold = true })

-- Quickfix active line colors - dark brown text on darker yellow background
vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = '#350e01', bg = '#a09040' })

-- Scroll offset
opt.scrolloff = 5

-- Vertical split character
opt.fillchars:append({ vert = '│' })

-- Performance - disable syntax for large files
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    local file_size = vim.fn.line2byte(vim.fn.line('$') + 1)
    if file_size > 1000000 then
      vim.cmd('syntax clear')
    end
  end,
})

-- File type specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    opt.tabstop = 2
    opt.softtabstop = 2
    opt.shiftwidth = 2
  end,
})

-- Disable list characters in NERDTree
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'nerdtree',
  callback = function()
    vim.opt_local.list = false
  end,
})

-- Auto-reload vimrc when saved
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = vim.fn.expand('~/.config/nvim/init.lua'),
  callback = function()
    vim.cmd('source ' .. vim.fn.expand('~/.config/nvim/init.lua'))
  end,
})

-- Resize splits when window is resized
vim.api.nvim_create_autocmd('VimResized', {
  pattern = '*',
  callback = function()
    vim.cmd('wincmd =')
  end,
})

-- Tmux window renaming integration
if vim.env.TMUX then
  vim.api.nvim_create_autocmd('VimLeave', {
    pattern = '*',
    callback = function()
      vim.fn.system('tmux setw automatic-rename')
    end,
  })

  vim.api.nvim_create_autocmd('FocusLost', {
    pattern = '*',
    callback = function()
      vim.fn.system('tmux setw automatic-rename')
    end,
  })

  vim.api.nvim_create_autocmd('FocusGained', {
    pattern = '*',
    callback = function()
      local dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      vim.fn.system('tmux rename-window " ' .. dir .. '"')
    end,
  })
end

-- True color support (24-bit color)
if vim.fn.has('termguicolors') == 1 then
  opt.termguicolors = true
end
