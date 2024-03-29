set shell=bash                " set default shell
set nocompatible              " be iMproved, required
set clipboard=unnamed " copy to the system clipboard

set autoread

"""
""" vim-plug
"""

call plug#begin('~/.vim/plugged')

source ~/.vim/Vundlefile.vim

call plug#end()

"""
""" Some defaults (tabs, line endings, etc)
"""

source ~/.vim/janus-settings.vim
source ~/.vim/carls-git-grep.vim
source ~/.vim/projectionist.vim
source ~/.vim/wiki.vim

"""
""" OS Specific settings
"""

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

:nmap <C-T> :tabnew<CR>

if executable('fzf')
  :nmap <C-p> :GFiles -X .gitignore<CR>
  :map <leader>ls :FZF<cr>
  :map <leader>lb :Buffers<cr>
  set rtp+=/usr/local/opt/fzf
else
" Allow Control P to fire the CtrlP plugin (doesn't by default?)
  :nmap <C-p> :CtrlP<CR>
  :map <leader>lb :CtrlPBuffer<cr>
  " Let CtrlP cache hang around on exit - useful for very large projects
  let g:ctrlp_clear_cache_on_exit = 0

  " set max files for CtrlP to scan https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt
  let g:ctrlp_max_files = 20000

  " set max height of CtrlP results
  let g:ctrlp_match_window = 'max:20'
endif

:map <leader>ty :set nonumber<cr>:GitGutterBufferDisable<cr>
:map <leader>uty :set number<cr>:GitGutterBufferEnable<cr>

" expand %% to current directory - from Kevin B., from DAS
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Commonly edited files
:nnoremap <leader>ev :e $MYVIMRC<cr>
:nnoremap <leader>eV :e ~/dotfiles/.vim/Vundlefile.vim<cr>
:nnoremap <leader>eb :e ~/.bashrc<cr>
:nnoremap <leader>ez :e ~/.zshrc<cr>
:nnoremap <leader>ef :e ~/dotfiles/config.fish<cr>
:nnoremap <leader>eB :e ~/dotfiles/Brewfile<cr>
:nnoremap <leader>eh :e /etc/hosts<cr>
:nnoremap <leader>et :e ~/.tmux.conf<cr>
:nnoremap <leader>eg :e ~/dotfiles/.gitconfig<cr>
:nnoremap <leader>es :e ~/.ssh/config<cr>
:nnoremap <leader>ek :e ~/dotfiles/kitty.conf<cr>

"reload my vimrc by using \rv (reload vim)
:nnoremap <leader>rv :source ~/.vimrc<cr>

" close all tabs but current (tab only)
:nnoremap <leader>to :tabonly<cr>

"open up related spec
:nnoremap <leader>s :call RelatedSpecVOpen()<cr>

source ~/.vim/vimux.vim

"map nerdcommenter to \/
nm <Leader>/ <plug>NERDCommenterInvert
vm <Leader>/ <plug>NERDCommenterInvert

" NERDTree
nnoremap <Leader>n :NERDTreeToggle<cr>
nmap <Leader>f :NERDTreeFind<CR>
let NERDTreeMinimalUI=1

" Close the tab if NERDTree is the only window remaining in it.
function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1) || &buftype == 'quickfix'
    q
  endif
endfunction

augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END

let g:NERDTreeWinSize = 37

" Moving lines and selections with Ctrl-J and K
nnoremap <C-k> :m-2<CR>==
nnoremap <C-j> :m+<CR>==
inoremap <C-j> <Esc>:m+<CR>==gi
inoremap <C-k> <Esc>:m-2<CR>==gi
vnoremap <C-j> :m'>+<CR>gv=gv
vnoremap <C-k> :m-2<CR>gv=gv

" use the mouse
" http://ayaz.wordpress.com/2010/10/19/using-mouse-inside-vim-on-terminal-app/
set mouse=a

" find all rebase/merge conflicts
nnoremap <Leader>fc :Git difftool<cr>

nnoremap <Leader>gg :GitGrep<Space>

" Write plain text. Nice for READMEs and other plain text.
nnoremap <Leader>wt :Goyo<cr>

" Un-write plain text, these mappings are mostly for brain backwards
" compatibility
nnoremap <Leader>uwt :Goyo<cr>
nnoremap <Leader>ut :Goyo<cr>

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

"""
""" Backup and swap files
"""

set backupdir=~/.cache/vim/backup/    " where to put backup files.
set directory=~/.cache/vim/swap/      " where to put swap files.
set undodir=~/.cache/vim/undo/      " where to put undo files.
set undofile
set backupskip=/tmp/*,/private/tmp/*

" History size
" http://usevim.com/2013/11/08/set-history/
set history=10000

" Word count
nnoremap <Leader>wc g<C-g>

" Format JSON
nnoremap <Leader>fj :%!jq<cr>:set ft=json<cr>gg<cr>gg

" highlight UTF-8 Line ending characters
if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
  let &listchars = "tab:\u21e5 ,trail:·,precedes:«,extends:»,nbsp:\u00b7"
  "set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶
  "set listchars=tab:→\ ,trail:␣,extends:…,eol:⏎
  "set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬
  "set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$

endif
set encoding=utf-8

" Python
" http://stackoverflow.com/questions/5601749/how-to-filter-out-files-by-extension-in-nerdtree
let NERDTreeIgnore = ['\.pyc$','dist','coverage','\.js.map$']
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2

" Use <C-L> to clear the highlighting of :set hlsearch.
noremap <silent> <C-L> :nohlsearch<CR><C-L>

"""
""" Visual Tweaks
"""

" Resize splits when the window is resized http://vimbits.com/bits/223
au VimResized * exe "normal! \<c-w>="

"set background=light

let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_statusline='flat'
"colorscheme solarized8_flat
"let g:solarized_statusline='high'
"colorscheme solarized8_high
colorscheme fireslime

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Always show the status line
set laststatus=2

" https://github.com/tmux-plugins/vim-tmux-focus-events
set autoread

autocmd FileType nerdtree setlocal nolist

set fillchars+=vert:\│

let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" Prevent quickfix items from opening in nerdtree
let g:qfenter_exclude_filetypes = ['nerdtree']

let g:markdown_fenced_languages = ['javascript']

nmap <C-W>z <Plug>(zoom-toggle)<C-l>

" Hide tmux when using distraction-free mode
function! s:goyo_enter()
  set wrap
  set linebreak
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  setlocal spell spelllang=en_us
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set nowrap
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  setlocal nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

if exists('$TMUX')
  " Set the tmux tab all pretty :)
  :autocmd VimLeave * !tmux setw automatic-rename
  :autocmd FocusLost * !tmux setw automatic-rename
  :autocmd FocusGained * !tmux rename-window " $(basename $(pwd))"
endif

" https://stackoverflow.com/questions/178257/how-to-avoid-syntax-highlighting-for-large-files-in-vim
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif
let g:LargeFile=10

" vim-visual-multi
let g:VM_mouse_mappings = 1
let g:VM_maps = {}
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

map <leader>X :w<CR>:call SetExecutable()<CR>
map <leader>mp :ALEFix prettier<cr>
map <leader>meh :ALEFix eslint<cr>
