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

" Ale
Plugin 'dense-analysis/ale'
let g:ale_enabled = 1
let g:ale_sign_error = '✗'
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = '--max-line-length=100'
let g:ale_python_pylint_executable = 'pylint'
let g:ale_python_black_executable = '/home/jlejeune/.local/bin/black'
let g:ale_python_isort_executable = '/home/jlejeune/.local/bin/isort'
" Check Python files
let g:ale_linters = {'python': ['flake8']}
let g:ale_linters_ignore = {'python': ['pylint']}
" Fix Python files
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\}
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1

" Isort
Plugin 'fisadev/vim-isort'

" Pending tasks list
Plugin 'fisadev/FixedTaskList.vim'

" vim-puppet
Plugin 'hunner/vim-puppet'

" tabular
Plugin 'godlygeek/tabular'

" Syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%b\ 0x%B
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let python_highlight_all=1
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_quiet_messages = { "type": "style" }
"let g:syntastic_python_python_exec = '/usr/bin/python3'
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_puppet_puppetlint_args = '--no-80chars-check'

" Airline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
"let g:airline_theme='iceberg'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set t_Co=256

" NERD Commenter
Plugin 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Jedi
Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<Tab>"
let g:jedi#rename_command = "<leader>r"

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

" Showing line numbers
set number

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
