" No vi-compatible
set nocompatible

""""""""""""
"" VUNDLE
""""""""""""
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

" Required for vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required!)
Plugin 'gmarik/Vundle.vim'

""""""""""""""""""""
"" BUNDLES VUNDLE
""""""""""""""""""""
"" File Browser
Plugin 'scrooloose/nerdtree'
" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

"" PEP8 and python-flakes checker
Plugin 'nvie/vim-flake8'

" Pending tasks list
Plugin 'fisadev/FixedTaskList.vim'

" Syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let python_highlight_all=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Auto-Indentation
Plugin 'vim-scripts/indentpython.vim'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
set t_Co=256

" Installing plugins the first time
if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :PluginInstall
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
set paste

" Tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Allow plugins by file type
filetype plugin on
filetype indent on

" Showing line numbers and length
set number
set textwidth=79
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80

" Show status bar
set laststatus=2

" UTF8 Support
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99

" Search
set incsearch
set ignorecase
set smartcase
set hlsearch

" Allow syntax highlight on
syntax on

" Load shorkeys
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

" Load functions
execute 'source ' . $HOME . '/.vim/functions.vim'

" Use a specific scheme for diff mode
if &diff
    colorscheme diff_scheme
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
