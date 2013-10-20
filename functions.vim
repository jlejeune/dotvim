" Function to display message in status bar
function! s:DisplayStatus(msg)
    echohl Todo
    echo a:msg
    echohl None
endfunction

" Function to remove trailing spaces (and restores cursor position)
function! CleanCode()
    mark z | %s/\s\+$//e | 'z
endfunction

" Open files at last position
function! s:CursorOldPosition()
    if line("'\"") > 0 && line("'\"") <= line("$")
        exe "normal g`\""
    endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()

" Function to show or not spaces and tab
function! ShowTab()
    if &list
        set nolist
    else
        set list
    end
endfunction

