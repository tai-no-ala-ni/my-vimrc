
""""""""""""""""""""""""""""""""""
"
" neosnippet
"
""""""""""""""""""""""""""""""""""
let g:neosnippet#snippets_directory='~/mydotfiles/mysnip/'
let g:neosnippet#enable_completed_snippet = 0
let g:neosnippet#enable_complete_done = 0
"let g:neosnippet#disable_runtime_snippets = {'_':1}

" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_or_jump)
nmap <C-k>     <Plug>(neosnippet_expand_or_jump)


" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['php'] = 'html,php'
