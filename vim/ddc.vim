
""""""""""""""""""""""""""""""""""
"
" pum
"
""""""""""""""""""""""""""""""""""
inoremap <silent><expr> <C-n>
      \ pum#visible() ? '<Cmd>call pum#map#insert_relative(+1)<CR>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#map#manual_complete()
inoremap <C-p> <Cmd>call pum#map#insert_relative(-1)<CR>
inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

if has('nvim')
set pumblend=10
endif

""""""""""""""""""""""""""""""""""
"
" ddc
"
""""""""""""""""""""""""""""""""""

" ddc global

" sources

call ddc#custom#patch_global('ui', 'native')

if has('nvim')
call ddc#custom#patch_global('sources', ['around','file','nvim-lsp','neosnippet','skkeleton'])
else
call ddc#custom#patch_global('sources', ['around','file','vim-lsp','neosnippet'])
endif

" sourceOptions
if has('nvim')
call ddc#custom#patch_global('sourceOptions', {
    \ 'around': {'mark': 'A'},
    \ 'file': {
    \   'mark': 'F',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*',
    \ },
    \ 'neosnippet': {
	    \ 'mark': 'neosnippet',
	    \ 'dup': v:true,
    \ },
    \ 'nvim-lsp': {
	    \ 'mark': 'nvim-lsp',
	    \ 'forceCompletionPattern': '\\.|:|->',
    \ },
    \ 'necovim': {'mark': 'necovim'},
	\ 'skkeleton': {
	\   'mark': 'skkeleton',
	\   'matchers': ['skkeleton'],
	\   'minAutoCompleteLength': 2,
	\   'isVolatile': v:true,
	\ },
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank']},
    \ 	'converters': ['converter_remove_overlap'],
    \ })
else

call ddc#custom#patch_global('sourceOptions', {
    \ 'around': {'mark': 'A'},
    \ 'file': {
    \   'mark': 'F',
    \   'isVolatile': v:true,
    \   'forceCompletionPattern': '\S/\S*',
    \ },
    \ 'neosnippet': {
	    \ 'mark': 'neosnippet',
	    \ 'dup': v:true,
    \ },
    \ 'vim-lsp': {
	    \ 'mark': 'vim-lsp',
	    \ 'forceCompletionPattern': '\\.|:|->',
		\ 'minAutoCompleteLength': 0,
    \ },
    \ 'necovim': {'mark': 'necovim'},
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank']},
    \ 	'converters': ['converter_remove_overlap'],
    \ })
endif


if has('nvim')
" sourceParams 
call ddc#custom#patch_global('sourceParams', {
    \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
    \ })
endif

" completionMenu
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('autoCompleteEvents', [
    \ 'InsertEnter', 'TextChangedI', 'TextChangedP',
    \ 'CmdlineEnter', 'CmdlineChanged',
    \ ])

" latex
if has('nvim')
"call ddc#custom#patch_filetype(['tex','bib'], 'sources', ['texlab'])
"call ddc#custom#patch_filetype(['tex','bib'],'sourceOptions', {
"	\ 'texlab': {
"	\   'mark': 'texlab',
"	\   'forceCompletionPattern': '\\.|:|->',
"	\ },
"	\ })
else
call vimtex#init()
call ddc#custom#patch_filetype(['tex'], 'sourceOptions', {
      \ 'omni': {
      \   'forceCompletionPattern': g:vimtex#re#deoplete
      \ },
      \ })
call ddc#custom#patch_filetype(['tex'], 'sourceParams', {
      \ 'omni': {'omnifunc': 'vimtex#complete#omnifunc'},
      \ })
endif

" vim
call ddc#custom#patch_filetype(['vim'],'sources',['necovim','around'])


" enable
call ddc#enable()

""""""""""""""""""""""""""""""""""
"
" deoplete
"
""""""""""""""""""""""""""""""""""

" let g:python_host_prog = '/usr/bin/python2'
" let g:python3_host_prog = '/usr/local/bin/python3.8'


if exists("$VIRTUAL_ENV")
  if !empty(glob("$VIRTUAL_ENV/bin/python3"))
    let g:python3_host_prog = '~/.virtualenvs/forVim/bin/python'
  else
    let g:python_host_prog = '~/.virtualenvs/forVim/bin/python'
  endif
endif

