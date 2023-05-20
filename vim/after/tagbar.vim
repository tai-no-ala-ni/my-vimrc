""""""""""""""""""""""""""""""""""
"
" tagbar
"
""""""""""""""""""""""""""""""""""
nmap gl :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""
"
" tag
"
""""""""""""""""""""""""""""""""""
set tags=.tags;$HOME

function! s:execute_ctags() abort
  let tag_name = '.tags'
  let tags_path = findfile(tag_name, '.;')
  if tags_path ==# ''
    return
  endif
  let tags_dirpath = fnamemodify(tags_path, ':p:h')
  execute 'silent !cd' tags_dirpath '&& ctags -R -f' tag_name '2> /dev/null &'
endfunction

augroup ctags
  autocmd!
  autocmd BufWritePost * call s:execute_ctags()
augroup END

"""""""""""""""""""""""""""""""""
"
" ctags
"
"""""""""""""""""""""""""""""""""
let g:pid = getpid()
let g:tag_file_path = "/tmp/" . g:pid . "_tags"
function! _CtagsUpdate()
    exe '!\ctags -R -f'.g:tag_file_path.' `pwd` &'
    exe 'set tags='.g:tag_file_path
endfunction
command! CtagsUpdate call _CtagsUpdate()

function! _CtagsRemove()
    exe '!rm '.g:tag_file_path
endfunction
command! CtagsRemove call _CtagsRemove()

let current_path = expand("%:p")
let match_idx = match(current_path, "/dev")
if match_idx != -1
    autocmd VimEnter * silent! :CtagsUpdate
    autocmd BufWrite * silent! :CtagsUpdate
    autocmd VimLeave * silent! :CtagsRemove
endif
