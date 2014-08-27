set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'danro/rename.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mikewest/vimroom'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tjennings/git-grep-vim'
Plugin 'jwhitley/vim-matchit'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
Plugin 'kchmck/vim-coffee-script'
Plugin 'jszakmeister/vim-togglecursor'

" Plugin '/JavaScript-Indent'
" Plugin '/operator-camelize.vim'
" Plugin '/vim-haml'
" Plugin '/vim-jade'
" Plugin '/vim-javascript-syntax'
" Plugin '/vim-less'
" Plugin '/vim-rabl'
" Plugin '/vim-scala'
" Plugin '/vim-slim'
" Plugin '/vim-spec-finder'
" Plugin '/vim-stylus'

call vundle#end()
filetype plugin on

" Some defaults (tabs, other things, etc) that janus gives us
source ~/.vim/janus-settings.vim
source ~/.vim/carls-git-grep.vim
if has("unix")
  let s:uname = system("uname -s")
  if s:uname =~ "Darwin"
    source ~/.vim/osx.vim
  elseif s:uname =~ "Linux"
    source ~/.vim/linux.vim
  endif
endif

" Geoff's hashrocket
imap <silent> <C-l> <Space>=><Space>

"Allow Control P to fire the CtrlP plugin (doesn't by default?)
:nmap <C-p> :CtrlP<CR>
:map <leader>ls :CtrlPBuffer<cr>
:nmap <C-T> :tabnew<CR>
map ,f <C-p>

" Let CtrlP cache hang around on exit
let g:ctrlp_clear_cache_on_exit = 0

" set max files for CtrlP to scan https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt
let g:ctrlp_max_files = 20000

" set max height of CtrlP results
let g:ctrlp_match_window = 'max:20'

" expand %% to current directory - from Kevin B., from DAS
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"open up my vimrc by using \ev (edit vim)
:nnoremap <leader>ev :e $MYVIMRC<cr>
"reload my vimrc by using \rv (reload vim)
:nnoremap <leader>rv :source ~/.vimrc<cr>
"open up my bashrc by using \eb (edit vim)
:nnoremap <leader>eb :e ~/.bashrc<cr>

"open up related spec
:nnoremap <leader>s :call RelatedSpecVOpen()<cr>

"vimux
" Run the current spec with rspec
map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

" Run the current line with rspec
map <Leader>rt :call VimuxRunCommand("clear; rspec " . bufname("%") . ':' .  line('.'))<CR>

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

"map nerdcommenter to \/
nm <Leader>/ <plug>NERDCommenterInvert
vm <Leader>/ <plug>NERDCommenterInvert

nnoremap <Leader>n :NERDTreeToggle<cr>
nmap <Leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI=1
"autocmd VimEnter * :NERDTreeToggle
"autocmd VimEnter * wincmd p
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

  let g:solarized_termtrans=1
  let g:solarized_termcolors=256

  colorscheme solarized
  set guioptions=egmrt
endif

" find all rebase/merge conflicts
nnoremap <Leader>fc :GitGrep '<<<<'<cr>

nnoremap <Leader>gg :GitGrep<Space>

nnoremap <Leader>wt :set wrap<cr>:set formatoptions=ta<cr>
nnoremap <Leader>uwt :set formatoptions=<cr>

" always show tab bar http://vim.1045645.n5.nabble.com/Always-show-tab-bar-in-MacVim-td1215150.html
:set showtabline=2

" ability to save with sudo http://vim.wikia.com/wiki/Su-write
cmap w!! %!sudo tee > /dev/null %

" Make Y behave like other capitals http://vimbits.com/bits/11
map Y y$

" Automatically reload vimrc when it's saved https://gist.github.com/nocash/1988620
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" Better comand-line editing http://vimbits.com/bits/30
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Resize splits when the window is resized http://vimbits.com/bits/223
au VimResized * exe "normal! \<c-w>="

" Clear trailing whitespace
nnoremap <Leader>ws :%s/\s\+$//<cr>

function! PromoteToLet()
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

set background=light

colorscheme solarized
"
" Backup and swap files
"

set backupdir=~/.cache/vim/backup/    " where to put backup files.
set directory=~/.cache/vim/swap/      " where to put swap files.
set undodir=~/.cache/vim/undo/      " where to put undo files.
set undofile

" Word count
nnoremap <Leader>wc g<C-g>

" Format JSON
nnoremap <Leader>fj :%!python -m json.tool<cr>:%s/    /  /g<cr>:%s/\s\+$//<cr>gg

" Excryption scheme
" http://usevim.com/2013/11/01/vim-encryption/
set cryptmethod=blowfish

" History size
" http://usevim.com/2013/11/08/set-history/
"
set history=100000

" UTF-8 Line ending characters
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
endif

" Python
" http://stackoverflow.com/questions/5601749/how-to-filter-out-files-by-extension-in-nerdtree
let NERDTreeIgnore = ['\.pyc$']
autocmd Filetype python setlocal ts=4 sts=4 sw=4

" Always show the status line
:set laststatus=2

" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" Use <C-L> to clear the highlighting of :set hlsearch.
noremap <silent> <C-L> :nohlsearch<CR><C-L>
-
