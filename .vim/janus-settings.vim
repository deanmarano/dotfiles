""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters

""
"" Searching
""

set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...

""
"" Wild settings
""

" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Disable javascript sourcemap files
set wildignore+=*.js.map

" Ignore bundler and sass cache
set wildignore+=*/.bundle/*,*/.sass-cache/*

" Ignore node_modules
set wildignore+=*/node_modules/*

" Disable temp and backup files
set wildignore+=*/tmp/*,*.swp,*~,._*,*/dist/*,*/coverage/*

" Disable Jekyll Site
set wildignore+=*/_site/*
