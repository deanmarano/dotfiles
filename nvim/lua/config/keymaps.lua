-- Keymaps
-- Migrated from .vimrc

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Geoff's hashrocket (insert mode Ctrl-L)
map('i', '<C-l>', ' => ', { noremap = true, silent = true })

-- New tab
map('n', '<C-T>', ':tabnew<CR>', opts)

-- Clear search highlighting with Ctrl-L
map('n', '<C-L>', ':nohlsearch<CR><C-L>', { noremap = true, silent = true })

-- Toggle copy mode (disable line numbers and gitgutter)
map('n', '<leader>ty', ':set nonumber<CR>:GitGutterBufferDisable<CR>', opts)
map('n', '<leader>uty', ':set number<CR>:GitGutterBufferEnable<CR>', opts)

-- Expand %% to current directory in command mode
map('c', '%%', "<C-R>=expand('%:h').'/'<cr>", { noremap = true })

-- Commonly edited files
map('n', '<leader>ev', ':e $MYVIMRC<CR>', opts)
map('n', '<leader>eV', ':e ~/dotfiles/nvim/lua/plugins/init.lua<CR>', opts)
map('n', '<leader>eb', ':e ~/.bashrc<CR>', opts)
map('n', '<leader>ez', ':e ~/dotfiles/zshrc<CR>', opts)
map('n', '<leader>ef', ':e ~/dotfiles/config.fish<CR>', opts)
map('n', '<leader>eB', ':e ~/dotfiles/Brewfile<CR>', opts)
map('n', '<leader>eh', ':e /etc/hosts<CR>', opts)
map('n', '<leader>et', ':e ~/.tmux.conf<CR>', opts)
map('n', '<leader>eg', ':e ~/dotfiles/.gitconfig<CR>', opts)
map('n', '<leader>es', ':e ~/.ssh/config<CR>', opts)
map('n', '<leader>ek', ':e ~/dotfiles/kitty.conf<CR>', opts)

-- Reload config (lazy.nvim way)
map('n', '<leader>rv', function()
  -- Clear loaded modules
  for name, _ in pairs(package.loaded) do
    if name:match('^config') or name:match('^plugins') then
      package.loaded[name] = nil
    end
  end
  -- Reload the config
  dofile(vim.env.MYVIMRC)
  vim.notify('Config reloaded!', vim.log.levels.INFO)
end, opts)

-- Close all tabs but current
map('n', '<leader>to', ':tabonly<CR>', opts)

-- Open related spec (requires vim-spec-finder plugin)
-- map('n', '<leader>s', ':call RelatedSpecVOpen()<CR>', opts)

-- NERDCommenter mappings
map('n', '<Leader>/', '<plug>NERDCommenterInvert', {})
map('v', '<Leader>/', '<plug>NERDCommenterInvert', {})

-- Neo-tree (file explorer)
map('n', '<Leader>n', ':Neotree toggle<CR>', opts)
map('n', '<Leader>f', ':Neotree reveal<CR>', opts)

-- Moving lines and selections with Ctrl-J and K
map('n', '<C-k>', ':m-2<CR>==', opts)
map('n', '<C-j>', ':m+<CR>==', opts)
map('i', '<C-j>', '<Esc>:m+<CR>==gi', opts)
map('i', '<C-k>', '<Esc>:m-2<CR>==gi', opts)
map('v', '<C-j>', ":m'>+<CR>gv=gv", opts)
map('v', '<C-k>', ":m-2<CR>gv=gv", opts)

-- Git commands
map('n', '<Leader>fc', ':Git difftool<CR>', opts)
map('n', '<Leader>gg', ':GitGrep ', { noremap = true }) -- No silent, we want to type

-- Distraction-free writing mode (Goyo)
map('n', '<Leader>wt', ':Goyo<CR>', opts)
map('n', '<Leader>uwt', ':Goyo<CR>', opts)
map('n', '<Leader>ut', ':Goyo<CR>', opts)

-- Save with sudo
map('c', 'w!!', '%!sudo tee > /dev/null %', { noremap = true })

-- Make Y behave like other capitals
map('n', 'Y', 'y$', { noremap = true })

-- Better command-line editing
map('c', '<C-j>', '<t_kd>', { noremap = true })
map('c', '<C-k>', '<t_ku>', { noremap = true })
map('c', '<C-a>', '<Home>', { noremap = true })
map('c', '<C-e>', '<End>', { noremap = true })

-- Clear trailing whitespace
map('n', '<Leader>ws', ':%s/\\s\\+$//<CR>', opts)

-- PromoteToLet function (Ruby/RSpec)
vim.api.nvim_create_user_command('PromoteToLet', function()
  vim.cmd('normal! dd')
  vim.cmd('normal! P')
  vim.cmd([[:.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/]])
  vim.cmd('normal ==')
end, {})
map('n', '<leader>p', ':PromoteToLet<CR>', opts)

-- Word count
map('n', '<Leader>wc', 'g<C-g>', opts)

-- Format JSON
map('n', '<Leader>fj', ':%!jq<CR>:set ft=json<CR>gg<CR>gg', opts)

-- Make file executable
local function set_executable()
  vim.fn.system('chmod +x ' .. vim.fn.expand('%'))
  print('Made file executable')
end

vim.api.nvim_create_user_command('SetExecutable', set_executable, {})
map('n', '<leader>X', ':w<CR>:SetExecutable<CR>', opts)

-- ALE fixes
map('n', '<leader>mp', ':ALEFix prettier<CR>', opts)
map('n', '<leader>meh', ':ALEFix eslint<CR>', opts)

-- Vimux mappings (tmux integration)
map('n', '<Leader>rb', ':call VimuxRunCommand("clear; bundle exec rspec " . bufname("%"))<CR>', opts)
map('n', '<Leader>rt', ':call VimuxRunCommand("clear; bundle exec rspec " . bufname("%") . ":" . line("."))<CR>', opts)
map('n', '<Leader>rp', ':VimuxPromptCommand<CR>', opts)
map('n', '<Leader>rl', ':VimuxRunLastCommand<CR>', opts)
map('n', '<Leader>ri', ':VimuxInspectRunner<CR>', opts)
map('n', '<Leader>rq', ':VimuxCloseRunner<CR>', opts)
