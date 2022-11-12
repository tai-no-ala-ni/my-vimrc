""""""""""""""""""""""""""""""""""
"
" skkeleton
"
""""""""""""""""""""""""""""""""""


" toggle skkeleton
imap <C-j> <Plug>(skkeleton-toggle)
cmap <C-j> <Plug>(skkeleton-toggle)

function! s:skkeleton_init() abort
  call skkeleton#config({
	\ 'eggLikeNewline': v:true,
	\ 'globalJisyo': '~/.skk/SKK-JISYO.L'
	\ })
  call skkeleton#register_kanatable('rom', {
	\ "z\<Space>": ["\u3000", ''],
	\ })
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END
augroup skkeleton-mode-changed
  autocmd!
  autocmd User skkeleton-mode-changed redrawstatus
augroup END

" henkan
call skkeleton#register_kanatable('rom', {
	  \ 'hh': ['お', 'h'],
	  \ 'jj': 'escape',
	  \ 'z,': ['―'],
	  \ "z\<Space>": ["\u3000"],
	  \ })
call skkeleton#register_keymap('henkan', "\<BS>", 'henkanBackward')
call skkeleton#register_keymap('henkan', "x", '')
