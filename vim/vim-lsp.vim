if has('nvim')
else

""""""""""""""""""""""""""""""""""
"
" lsp
"
""""""""""""""""""""""""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <Leader>ld <plug>(lsp-definition)
    nmap <buffer> <Leader>ls <plug>(lsp-document-symbol-search)
    nmap <buffer> <Leader>lS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> <Leader>lr <plug>(lsp-references)
    nmap <buffer> <Leader>li <plug>(lsp-implementation)
    nmap <buffer> <Leader>lt <plug>(lsp-type-definition)
    nmap <buffer> <Leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    let g:lsp_diagnostics_echo_cursor=1
    let g:lsp_text_edit_enabled=1
"    let g:asyncomplete_auto_popup=1
"    let g:asyncomplete_popup_delay=200
    autocmd! BufWritePre *.yml,*.c,*.h,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

nnoremap <Leader>l [lsp]

" <Leader>leでvim-lspを有効化
nnoremap <silent> [lsp]e :<C-u>call <SID>EnableLsp()<CR>
" <Leader>ldでvim-lspを無効化
nnoremap <silent> [lsp]d :<C-u>call lsp#disable()<CR>

endif
