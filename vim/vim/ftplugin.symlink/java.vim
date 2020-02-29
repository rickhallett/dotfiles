nnoremap <silent> <buffer> <leader>jc :Checkstyle<CR>
nnoremap <silent> <buffer> <leader>jC :JavaCorrect<CR>
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch -x declarations<CR>
nnoremap <silent> <buffer> <leader>ji :JavaImportOrganize<CR>
nnoremap <silent> <buffer> <leader>jm :JavaImpl<CR>
nnoremap <silent> <buffer> <leader>jt :JUnit %<CR>
nnoremap <silent> <buffer> <leader>jTM :JUnitImpl<CR>
nnoremap <silent> <buffer> <leader>jTT :JUnitFindTest<CR>

nnoremap <silent> <buffer> <cr> :JavaSearchContext<CR>

" Add static import with <leader>jI
" based on adding a regular import with <leader>ji
nnoremap <silent> <buffer> <leader>jI :AddStaticImport<CR>

if &completefunc != '' | let &l:omnifunc=&completefunc | endif
nnoremap <silent> <buffer> <CR> :JavaSearchContext<CR>

setlocal path=,,.,**/src/**/java

let b:ale_linters = []
