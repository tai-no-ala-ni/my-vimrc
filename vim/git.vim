
"""""""""""""""""""""""""""""""""
"
" agit
"
"""""""""""""""""""""""""""""""""
nnoremap <Leader>ag :<C-u>Agit<CR>

""""""""""""""""""""""""""""""""""
"
" github-issues.vim
"
""""""""""""""""""""""""""""""""""
let g:github_complete_emoji_japanese_workaround = 1

"""""""""""""""""""""""""""""""""
"
" vim-fugitive
"
"""""""""""""""""""""""""""""""""
nnoremap <Leader>g :<C-u>Git<CR> 
nnoremap <Leader>gp :<C-u>Git push<CR>
nnoremap <Leader>ga :<C-u>Git add 
nnoremap <Leader>gs :<C-u>Git status<CR>
nnoremap <Leader>gd :<C-u>Git diff<CR>
nnoremap <Leader>gc :<C-u>Git commit -m

"""""""""""""""""""""""""""""""""
"
" vim-flog
"
"""""""""""""""""""""""""""""""""
nnoremap <Leader>fl <Plug>FlogVDiffSplitPathsRight


""""""""""""""""""""""""""""""""""
"
" OpenGithubFile
"
""""""""""""""""""""""""""""""""""
nnoremap go :<C-u>OpenGithubFile<CR>
xnoremap go :OpenGithubFile<CR>

