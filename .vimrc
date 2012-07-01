
" Pathogen
call pathogen#infect()
syntax on
filetype plugin indent on

source ~/.vim/janus-settings.vim

" Vim default register uses the OS X clipboard.
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set clipboard=unnamed
" <Ctrl-l> redraws the screen and removes any search highlighting.
" http://stackoverflow.com/questions/99161/
nnoremap <silent> <C-l> :nohl<CR><C-l>

"Allow Control P to fire the CtrlP plugin (doesn't by default?)
:nmap <C-p> :CtrlP<CR>
:nmap <C-T> :tabnew<CR>

" expand %% to current directory - from Kevin B.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"open up my vimrc by using \ev
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"map nerdcommenter to \/
:nm <Leader>/ <plug>NERDCommenterInvert
:nnoremap <Leader>n :NERDTreeToggle<cr>

" Moving lines and selections with Ctrl-J and K
nnoremap <C-k> :m-2<CR>==
nnoremap <C-j> :m+<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" use the mouse!!
" http://ayaz.wordpress.com/2010/10/19/using-mouse-inside-vim-on-terminal-app/
set mouse=a

" MacVim settings
if has('gui_running')
  syntax enable
  set guifont=Monaco:h15
  colorscheme solarized
  set guioptions=egmrt
endif

colorscheme solarized
