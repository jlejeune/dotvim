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
let g:jedi#popup_select_first = 0
let g:jedi#completions_command = "<C-N>"
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

" Syntastic
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_puppet_puppetlint_args = '--no-80chars-check'

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
highlight LineNr ctermbg=blue ctermfg=gray

" Show status bar
set laststatus=2

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
