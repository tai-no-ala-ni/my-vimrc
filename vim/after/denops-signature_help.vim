""""""""""""""""""""""""""""""""""
"
" dneops-signature_help
"
""""""""""""""""""""""""""""""""""
let g:signature_help_config = {
      \ 'border': v:true,
      \ 'maxWidth': 100,
      \ 'maxHeight': 30,
      \ 'viewStyle': "floating",
      \ 'onTriggerChar': v:false,
      \ 'multiLabel': v:false,
      \ 'fallbackToBelow': v:true,
      \ }
let g:lsp_signature_help_enabled = 0
call signature_help#enable()

