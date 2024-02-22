" Should set g:deol#prompt_pattern.
let g:deol#prompt_pattern = has('win32') ? '\f\+>' : '\w*% \?'
nnoremap <silent> <Leader>dt :<C-u>call deol#start()<CR>
let g:deol#custom_map = #{
	\   edit: 'e',
	\   start_insert: 'i',
	\   start_insert_first: 'I',
	\   start_append: 'a',
	\   start_append_last: 'A',
	\   execute_line: '<CR>',
	\   previous_prompt: '<C-p>',
	\   next_prompt: '<C-n>',
	\   paste_prompt: '<C-y>',
	\   bg: '<C-z>',
	\   quit: 'q',
	\ }

