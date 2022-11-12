if executable('platex')

""""""""""""""""""""""""""""""""""
"
" vimtex
"
""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
let g:vimtex_syntax_conceal = {
	  \ 'accents': 0,
	  \ 'ligatures': 0,
	  \ 'cites': 0,
	  \ 'fancy': 0,
	  \ 'greek': 0,
	  \ 'math_bounds': 0,
	  \ 'math_delimiters': 0,
	  \ 'math_fracs': 0,
	  \ 'math_super_sub': 0,
	  \ 'math_symbols': 0,
	  \ 'sections': 0,
	  \ 'styles': 0,
	  \}

endif
