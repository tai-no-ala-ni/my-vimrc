"call deoppet#initialize()
"call deoppet#custom#option('snippets',
"\ map(globpath(&runtimepath, 'neosnippets', 1, 1),
"\     { _, val -> { 'path': val } }))
"call deoppet#custom#option('snippets',
"\ map(globpath('~/mydotfiles', 'mysnip', 1, 1),
"\     { _, val -> { 'path': val } }))
"
"imap <C-k>  <Plug>(deoppet_expand)
"imap <C-f>  <Plug>(deoppet_jump_forward)
"imap <C-b>  <Plug>(deoppet_jump_backward)
"smap <C-f>  <Plug>(deoppet_jump_forward)
"smap <C-b>  <Plug>(deoppet_jump_backward)
