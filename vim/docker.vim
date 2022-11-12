
""""""""""""""""""""""""""""""""""
"
" vim docker
"
""""""""""""""""""""""""""""""""""
" open browser command, deafult is 'open'
let g:docker_open_browser_cmd = 'open'

" split temrinal windows, can use vert or tab, etc...
" see :h vert
let g:docker_terminal_open = 'bo'

" check plugin's version when plugin loading.
" default is checking.
" If you not want to check, please set 0 to this option.
let g:docker_plugin_version_check = 1

" Set value to 1 can enable using tmux to attach container.
" default value: 0
let g:docker_use_tmux = 1


""""""""""""""""""""""""""""""""""
"
" vim docker compose
"
""""""""""""""""""""""""""""""""""
" open terminal way
let g:docker_compose_open_terminal_way = 'top'

