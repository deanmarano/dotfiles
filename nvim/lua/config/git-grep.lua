-- Git grep custom keybindings
-- Migrated from carls-git-grep.vim

-- Get visual selection helper function
local function get_visual_selection()
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local start_col = start_pos[3]
  local end_line = end_pos[2]
  local end_col = end_pos[3]

  local lines = vim.fn.getline(start_line, end_line)

  if #lines == 0 then
    return ''
  end

  -- Adjust last line to end column
  if vim.o.selection == 'inclusive' then
    lines[#lines] = string.sub(lines[#lines], 1, end_col)
  else
    lines[#lines] = string.sub(lines[#lines], 1, end_col - 1)
  end

  -- Adjust first line to start column
  lines[1] = string.sub(lines[1], start_col)

  return table.concat(lines, '\n')
end

-- Normal mode: grep word under cursor
vim.keymap.set('n', '<C-g>', function()
  local word = vim.fn.expand('<cword>')
  vim.cmd('GitGrep ' .. word)
end, { noremap = true, silent = true })

-- Visual mode: grep selected text
vim.keymap.set('v', '<C-g>', function()
  local selection = get_visual_selection()
  -- Escape the selection for command line use
  selection = vim.fn.escape(selection, '"\\')
  -- Exit visual mode
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  -- Run GitGrep command
  vim.schedule(function()
    vim.cmd('GitGrep "' .. selection .. '"')
  end)
end, { noremap = true })
