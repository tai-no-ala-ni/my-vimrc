
""""""""""""""""""""""""""""""""""
"
" denops-popup-preview
"
""""""""""""""""""""""""""""""""""
let g:popup_preview_config = {
      \ 'maxWidth': 60,
      \ 'maxHeight': 30,
      \ }
call popup_preview#enable()

" popup color
highlight Pmenu ctermbg=8 guibg=#606060
highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=0 guibg=#d6d6d6
