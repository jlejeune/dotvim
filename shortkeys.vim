" show pending tasks list
map <F2> <Esc>:TaskList<CR>

" Call CleanCode() function to remove trailing spaces
map <F3> <Esc>:call CleanCode()<CR>

" Open Tagbar
map <F4> <Esc>:TagbarToggle<CR>

" Invert paste mode
noremap <F8> :set invpaste paste?<CR>
"set pastetoggle=<F8>
"set showmode

" Open files browser
map <F9> <Esc>:NERDTreeToggle<CR>

" Display or not spaces and tab
noremap <F12> :call ShowTab()<CR>
inoremap <F12> <Esc>:call ShowTab()<CR>

" Enable folding with the spacebar
nnoremap <space> za
