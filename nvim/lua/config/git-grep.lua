-- Git grep custom keybindings
-- Migrated from carls-git-grep.vim

-- Get visual selection helper function
-- Matches the logic from carls-git-grep.vim
local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local lnum1 = start_pos[2]
  local col1 = start_pos[3]
  local lnum2 = end_pos[2]
  local col2 = end_pos[3]

  local lines = vim.fn.getline(lnum1, lnum2)

  if #lines == 0 then
    return ''
  end

  -- Adjust last line to end column
  -- Vim columns are 1-indexed, Lua string.sub is 1-indexed
  -- For inclusive selection, we want up to col2; for exclusive, up to col2-1
  local end_char = vim.o.selection == 'inclusive' and col2 or (col2 - 1)
  lines[#lines] = string.sub(lines[#lines], 1, end_char)

  -- Adjust first line to start column
  -- col1 is 1-indexed, so col1 itself is the start position in Lua's string.sub
  lines[1] = string.sub(lines[1], col1)

  return table.concat(lines, '\n')
end

-- Normal mode: grep word under cursor
vim.keymap.set('n', '<C-g>', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('GitGrep ' .. word)
end, { noremap = true, silent = true })

-- Visual mode: grep selected text
-- Use expression mapping to get the selection and build the command
vim.keymap.set('v', '<C-g>', function()
  -- Use vim.fn.mode to get mode before marks
  local mode = vim.fn.mode()

  -- Get current visual selection using built-in vim function
  -- This uses getregion which is more reliable
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")

  -- For visual mode, we need to update the marks first by exiting and re-entering
  -- So we'll use a different approach: yank to a register and read it
  vim.cmd('noautocmd normal! "vy')
  local selection = vim.fn.getreg('v')

  if selection and selection ~= '' then
    -- Escape the selection for command line use
    selection = vim.fn.escape(selection, '"\\')
    -- Build and execute the command
    vim.cmd('GitGrep "' .. selection .. '"')
  end
end, { noremap = true })
