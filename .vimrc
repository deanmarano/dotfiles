" Pathogen
call pathogen#infect()

filetype plugin indent on

" Some defaults (tabs, other things, etc) that janus gives us
source ~/.vim/janus-settings.vim

" Vim default register uses the OS X clipboard.
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing#Comments
set clipboard=unnamed

" <Ctrl-l> redraws the screen and removes any search highlighting.
" http://stackoverflow.com/questions/99161/
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Geoff's hashrocket
imap <silent> <C-l> <Space>=><Space>

"Allow Control P to fire the CtrlP plugin (doesn't by default?)
:nmap <C-p> :CtrlP<CR>
:nmap <C-T> :tabnew<CR>

" expand %% to current directory - from Kevin B.
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"open up my vimrc by using \ev (edit vim)
:nnoremap <leader>ev :e $MYVIMRC<cr>
"reload my vimrc by using \rv (reload vim)
:nnoremap <leader>rv :source ~/.vimrc<cr>

"open up related spec
:nnoremap <leader>s :call RelatedSpecVOpen()<cr>

"map nerdcommenter to \/
:nm <Leader>/ <plug>NERDCommenterInvert
:vm <Leader>/ <plug>NERDCommenterInvert
:nnoremap <Leader>n :NERDTreeToggle<cr>
autocmd VimEnter * :NERDTreeToggle
autocmd VimEnter * wincmd p
"autoclose NERDTree if it's the last thing left
"https://github.com/scrooloose/nerdtree/issues/21
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" always show status line http://vim.wikia.com/wiki/Displaying_status_line_always
:set laststatus=2

set background=dark
colorscheme solarized
