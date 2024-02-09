
""""""""""""""""""""""""""""""""""
"
" deoplete
"
""""""""""""""""""""""""""""""""""
	if !has('win32')
	if exists('$VIRTUAL_ENV')
		let g:python3_host_prog = $VIRTUAL_ENV . '/bin/python'
		let g:python_host_prog = $VIRTUAL_ENV . '/bin/python'
	else
		let g:python3_host_prog = system('type asdf &> /dev/null && echo -n "$HOME/.asdf/shims/python" || echo -n $(which python)')
		let g:python_host_prog = system('type asdf &> /dev/null && echo -n "$HOME/.asdf/shims/python" || echo -n $(which python)')
	endif
	else
		let python_path = system('where python.exe')
		let python_path = split(python_path,'\n')[0]
		let g:python3_host_prog = python_path
		let g:python_host_prog = python_path
	endif

""""""""""""""""""""""""""""""""""
"
" pum
"
""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <C-n>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <silent><expr> <C-p>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(-1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

if has('nvim')
set pumblend=10
endif

""""""""""""""""""""""""""""""""""
"
" deoppet
"
""""""""""""""""""""""""""""""""""
"if has('nvim')
"call deoppet#initialize()
"call deoppet#custom#option('snippets',
"\ map(globpath(&runtimepath, 'neosnippets', 1, 1),
"\     { _, val -> { 'path': val } }))
""call deoppet#custom#option('snippets',
""\ map(globpath('~/mydotfiles', 'mysnip', 1, 1),
""\     { _, val -> { 'path': val } }))
"
"imap <C-k>  <Plug>(deoppet_expand)
"imap <C-f>  <Plug>(deoppet_jump_forward)
"imap <C-b>  <Plug>(deoppet_jump_backward)
"smap <C-f>  <Plug>(deoppet_jump_forward)
"smap <C-b>  <Plug>(deoppet_jump_backward)
"endif

""""""""""""""""""""""""""""""""""
"
" ddc
"
""""""""""""""""""""""""""""""""""

" ddc global

" sources

call ddc#custom#patch_global('ui', 'native')
call ddc#enable_terminal_completion()

if has('nvim')
"call ddc#custom#patch_global('sources', ['around','file','nvim-lsp','neosnippet','skkeleton'])
call ddc#custom#patch_global('sources', ['around','file','lsp','neosnippet'])
"call ddc#custom#patch_global('sources', ['around','file','lsp','neosnippet'])
else
call ddc#custom#patch_global('sources', ['around','file','lsp','neosnippet'])
endif

" sourceOptions
"if has('nvim')
	call ddc#custom#patch_global('sourceOptions', #{
    \ around: #{mark: 'A'},
    \ file: #{
    \   mark: 'F',
    \   isVolatile: v:true,
    \   forceCompletionPattern: '\S/\S*',
    \ },
    \ neosnippet: #{
	    \ mark: 'NS',
	    \ dup:"keep",
    \ },
    \ lsp: #{
	    \ mark: 'LSP',
		\ keywordPattern: '\k+'
    \ },
    \ necovim: #{mark: 'necovim'},
	\ skkeleton: #{
	\   mark: 'skkeleton',
	\   matchers: ['skkeleton'],
	\   minAutoCompleteLength: 2,
	\   isVolatile: v:true,
	\ },
    \ _: #{
    \   matchers: ['matcher_fuzzy'],
    \   sorters: ['sorter_fuzzy'],
    \ 	converters: ['converter_fuzzy'],
    \ }
	\ })
	"call ddc#custom#patch_global('uiParams', #{
	"  \   pum: #{
	"  \     insert: v:true,
	"  \   }
	"  \ })
"else
"call ddc#custom#patch_global('sourceOptions', {
"    \ 'around': {'mark': 'A'},
"    \ 'file': {
"    \   'mark': 'F',
"    \   'isVolatile': v:true,
"    \   'forceCompletionPattern': '\S/\S*',
"    \ },
"    \ 'neosnippet': {
"	    \ 'mark': 'NS',
"	    \ 'dup': 'keep',
"    \ },
"    \ 'lsp': {
"	    \ 'mark': 'LSP',
"	    \ 'forceCompletionPattern': '\\.|:|->',
"		\ 'minAutoCompleteLength': 1,
"    \ },
"    \ 'necovim': {'mark': 'necovim'},
"    \ '_': {
"    \   'matchers': ['matcher_head'],
"    \   'sorters': ['sorter_rank']},
"    \ 	'converters': ['converter_remove_overlap'],
"    \ })
"
"endif


if has('nvim')
" sourceParams 
call ddc#custom#patch_global('sourceParams', #{
	\ lsp: #{
	\  snippetEngine: denops#callback#register({
	\        body -> neosnippet#anonymous(body)
	\  }),
	\  enableResolveItem: v:true,
	\  enableAdditionalTextEdits: v:true,
	\  confirmBehavior: 'insert',
	\ },
\ })
endif

" completionMenu
call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
    \ 'CmdlineEnter', 'CmdlineChanged', 'TextChangedT'
    \ ])

" latex
"call ddc#custom#patch_filetype(['tex','bib'], 'sources', ['texlab'])
"call ddc#custom#patch_filetype(['tex','bib'],'sourceOptions', {
"	\ 'texlab': {
"	\   'mark': 'texlab',
"	\   'forceCompletionPattern': '\\.|:|->',
"	\ },
"	\ })
"call vimtex#init()
"call ddc#custom#patch_filetype(['tex'], 'sourceOptions', {
"      \ 'omni': {
"      \   'forceCompletionPattern': g:vimtex#re#deoplete
"      \ },
"      \ })
"call ddc#custom#patch_filetype(['tex'], 'sourceParams', {
"      \ 'omni': {'omnifunc': 'vimtex#complete#omnifunc'},
"      \ })

" vim
call ddc#custom#patch_filetype(['vim'],'sources',['necovim','around'])

" For deol buffer.
call ddc#custom#patch_filetype(['deol'], #{
\   specialBufferCompletion: v:true,
\   sources: ['shell-native', 'around'],
\   sourceOptions: #{
\     _: #{
\       keywordPattern: '[0-9a-zA-Z_./#:-]*',
\     },
\	  shell-native: #{mark: 'zsh'},
\   },
\	sourceParams: #{
\	  shell-native: #{shell: 'zsh'},
\	},
\ })

" enable
call ddc#enable()

