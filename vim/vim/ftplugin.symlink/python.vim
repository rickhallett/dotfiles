setlocal autoread

silent let s:black_command = substitute(system('type black'), '\n\+$', '', '')
if s:black_command == "black not found"
    echom 'Skipping black formatting, unable to find black command'
elseif filereadable(matchstr(s:black_command, "[^ ]*$")) " is the black command a file?
    autocmd! BufWritePre <buffer> call s:PythonAutoformat()
else
    echom 'Skipping black formatting, unable to find black command'
endif

function s:PythonAutoformat() abort
    let cursor_pos = getpos('.')
    execute ':%!black -q - 2>/dev/null'
    call cursor(cursor_pos[1], cursor_pos[2])
endfunction
