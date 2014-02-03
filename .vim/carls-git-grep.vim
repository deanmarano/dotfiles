" Carl's Git Grep Vim
" http://codemarks.com/codemarks/5756

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

noremap <C-g> :GitGrep <cword><CR>
vmap <C-g> :<C-U>GitGrep "<C-R><C-R>=<SID>get_visual_selection()<CR>"<CR>
