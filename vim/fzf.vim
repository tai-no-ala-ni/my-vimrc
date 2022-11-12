
""""""""""""""""""""""""""""""""""
"
" fzf
"
""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf

let g:fzf_buffers_jump = 1
nnoremap <silent> <Leader>ff :<C-u>Ag<CR>
nnoremap <silent> <Leader>fh :<C-u>History<CR>
nnoremap <silent> <Leader>ft :<C-u>call fzf#vim#tags(expand('<cword>'))<CR>
nnoremap <silent> <Leader>fb :<C-u>Buffers<CR>
nnoremap <silent> <Leader>fgs :<C-u>GFiles?<CR>
nnoremap <silent> <Leader>fgf :<C-u>GFiles<CR>
nnoremap <silent> <Leader>fm :<C-u>Marks<CR>
nnoremap <silent> <Leader>ft :<C-u>Tags<CR>
let g:fzf_layout = { 'down': '30%' }
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-j': 'split',
\ 'ctrl-l': 'vsplit' }

augroup vimrc_fzf
  autocmd!
  autocmd FileType fzf tnoremap <buffer> <Leader>z <Esc>
augroup END

let g:fzf_tags_command = 'ctags -R'

