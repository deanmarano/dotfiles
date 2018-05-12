" Run the current spec with rspec
map <Leader>rb :call VimuxRunCommand("clear; bin/rspec " . bufname("%"))<CR>

" Run the current spec with zeus rspec
map <Leader>rz :call VimuxRunCommand("clear; zeus rspec " . bufname("%"))<CR>

" Run the current line with rspec
map <Leader>rt :call VimuxRunCommand("clear; bin/rspec " . bufname("%") . ':' .  line('.'))<CR>

" Run the current feature with cucumber
map <Leader>rc :call VimuxRunCommand("clear; cucumber " . bufname("%"))<CR>

" Run the current feature with cucumber
map <Leader>rf :call VimuxRunCommand("clear; cucumber " . bufname("%"))<CR>

" Run the current script with r
map <Leader>rr :call VimuxRunCommand("clear; r -q -f " . bufname("%"))<CR>

" Prompt for a command to run
map <Leader>rp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
map <Leader>rl :VimuxRunLastCommand<CR>

" Inspect runner pane
map <Leader>ri :VimuxInspectRunner<CR>

" Close all other tmux panes in current window
map <Leader>rx :VimuxClosePanes<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>rq :VimuxCloseRunner<CR>

" Interrupt any command running in the runner pane
map <Leader>rs :VimuxInterruptRunner<CR>nnoremap <leader>t :call RunVimTmuxCommand()<cr>
