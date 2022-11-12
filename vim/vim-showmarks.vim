
""""""""""""""""""""""""""""""""""
"
" show mark
"
""""""""""""""""""""""""""""""""""
augroup show_marks_sync
  autocmd!
  autocmd BufReadPost * silent! DoShowMarks
augroup END

