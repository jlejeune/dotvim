" No vi-compatible
set nocompatible

""""""""""""
"" VUNDLE
""""""""""""
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

" Required for vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required!)
Bundle 'gmarik/vundle'

""""""""""""""""""""
"" BUNDLES VUNDLE
""""""""""""""""""""
"" File Browser
Bundle 'scrooloose/nerdtree'
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"" Buffer Explorer
Bundle 'fholgado/minibufexpl.vim'

"" Python autocompletion and documentation
Bundle 'davidhalter/jedi-vim'
" jedi-vim customizations
let g:jedi#popup_on_dot = 0
"let g:jedi#show_call_signatures = 0

"" Class/module browser
Bundle 'majutsushi/tagbar'
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

"" PEP8 and python-flakes checker
Bundle 'nvie/vim-flake8'
" rules to ignore (example: "E501,W293")
let g:flake8_ignore="E501"

" Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"""""""""""""""
"" MAIN CONF
"""""""""""""""
" Save
set nobackup
set nowritebackup
set noswapfile

" Indent
set autoindent

" Tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Allow plugins by file type
filetype plugin on
filetype indent on

" Text length
set textwidth=79

" Show status bar
set laststatus=2

" Allow incremental search
set incsearch

" Case
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" Allow syntax highlight on
syntax on

" Display line numbers
set nu
highlight LineNr ctermbg=blue ctermfg=gray

" Highlight last column defined by textwidth
set cc=+1

" Load shorkeys
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

" Load functions
execute 'source ' . $HOME . '/.vim/functions.vim'

