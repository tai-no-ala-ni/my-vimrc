" plugin Install
call plug#begin()
Plug 'Shougo/pum.vim' " popup window
if executable('deno')
Plug 'vim-denops/denops.vim' " deno
Plug 'Shougo/ddc.vim' " ddc auto complete
Plug 'Shougo/ddc-around' " around cursor completion for ddc.vim
Plug 'LumaKernel/ddc-file' " filename complete
Plug 'Shougo/ddc-matcher_head' " heading matcher for ddc.vim
Plug 'Shougo/ddc-sorter_rank' " matched rank order sorter for ddc.vim
Plug 'Shougo/ddc-converter_remove_overlap' " no double complete
Plug 'Shougo/ddc-omni' " omnifunc completion for ddc
Plug 'Shougo/ddc-ui-native' " native ui for ddc
Plug 'tani/ddc-fuzzy' " fuzzy matching filters for ddc.vim
Plug 'matsui54/ddc-dictionary' " dictionary complete (for ddc)
Plug 'vim-skk/skkeleton' " skk (japanese input method for vim)
Plug 'skanehira/denops-translate.vim' " translate
endif
if executable('fzf')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fzf
Plug 'junegunn/fzf.vim' " fzf
endif
if has('nvim')
"for nvim
Plug 'neovim/nvim-lspconfig' " language server protocol
Plug 'williamboman/mason.nvim' " lsp setting
Plug 'williamboman/mason-lspconfig.nvim' " lsp setting
Plug 'jose-elias-alvarez/null-ls.nvim' " linter and formatter
Plug 'Shougo/ddc-nvim-lsp' " lsp for nvim
Plug 'lukas-reineke/virt-column.nvim' " set virtual text color?
Plug 'folke/lsp-colors.nvim' " lsp colors
Plug 'tai-no-ala-ni/molomolokaikai' " molomolokaikai colorscheme
Plug 'AlessandroYorba/Alduin' " Alduin color
Plug 'lewis6991/gitsigns.nvim' " gitsigns
Plug 'norcalli/nvim-colorizer.lua' " colorizer
Plug 'nvim-lua/plenary.nvim' " lua function
Plug 'nvim-telescope/telescope.nvim', { 'on' : [] ,'tag': '0.1.0' } " telescope
Plug 'folke/which-key.nvim' " which-key
Plug 'rcarriga/nvim-notify' " notify
Plug 'kyazdani42/nvim-web-devicons' " icon
Plug 'nvim-tree/nvim-tree.lua',{'on': [] } " file tree
Plug 'romgrk/barbar.nvim' " tabline
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter
"Plug 'rcarriga/nvim-notify' " notify
"Plug 'MunifTanjim/nui.nvim' " ui
"Plug 'folke/noice.nvim' " change view of messages,cmdline,popupmenu
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' , 'for': 'markdown' }
"Plug 'eandrju/cellular-automaton.nvim' " relax animation
else
" for vim
Plug 'liuchengxu/vim-which-key' " which-key
Plug 'prabirshrestha/vim-lsp' " language server protocol
Plug 'mattn/vim-lsp-settings' " lsp setting
Plug 'shun/ddc-vim-lsp' " vim-lsp for ddc.vim
Plug 'lervag/vimtex' " vim tex
endif
" vim/nvim
Plug 'evanleck/vim-svelte', {'for': 'svelte'} " svelte syntax highlight
Plug 'vim-jp/vimdoc-ja' " vim help in japanese
Plug 'matsui54/denops-signature_help' " shows signature help from lsp server
Plug 'matsui54/denops-popup-preview.vim' " denops popup preview
Plug 'Shougo/neco-vim' " Vim completion source
Plug 'itchyny/lightline.vim' " good status line
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/vimproc.vim', {'do': 'make'} " async
Plug 'mattn/emmet-vim' " html emmet
Plug 'ekalinin/dockerfile.vim' " dockerfile syntax
Plug 'github/copilot.vim' " copilot
Plug 'wakatime/vim-wakatime' " wakatime
Plug 'chrisbra/csv.vim' " csv
Plug 'cohama/agit.vim' " agit
Plug 'tyru/open-browser.vim' " open-browser
Plug 'tyru/open-browser-github.vim' " open-browser-github
Plug 'dhruvasagar/vim-table-mode' " write markdown table
Plug 'rhysd/github-complete.vim' " github complete
Plug 'mattn/webapi-vim' " webapi
Plug 'mattn/vim-gist' " use gist from vim
Plug 'ctrlpvim/ctrlp.vim' " selecter
Plug 'KeitaNakamura/neodark.vim' " neodark
Plug 'preservim/tagbar' " tagbar
Plug 'jacquesbh/vim-showmarks' " show mark
Plug 'jiangmiao/auto-pairs' " auto-pairs
Plug 'tpope/vim-surround' " surround
Plug 'kana/vim-textobj-user' " user defined textobj
Plug 'osyo-manga/vim-textobj-blockwise' " cIw and <C-v>iw
Plug 'thinca/vim-textobj-between' " textobj between word
Plug 'kana/vim-operator-user' " user defined operator
Plug 'kana/vim-operator-replace' " replace operator
"Plug 'itchyny/calendar.vim'	" calendar
Plug 'junegunn/goyo.vim'	" goyo
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'rbong/vim-flog' " git log graph
Plug 'jparise/vim-graphql' " graphql
call plug#end()

""""""""""""""""""""""""""""""""""
"
" indent setting
"
""""""""""""""""""""""""""""""""""
set tabstop=4
set shiftwidth=4

""""""""""""""""""""""""""""""""""
"
" font
"
""""""""""""""""""""""""""""""""""
set guifont=HackGenNerd
set guifontwide=HackGenNerd
""""""""""""""""""""""""""""""""""
"
" highlight
"
""""""""""""""""""""""""""""""""""
highlight Pmenu ctermfg=81 ctermbg=8 guifg=#66D9EF guibg=#303548

""""""""""""""""""""""""""""""""""
"
" leader
"
""""""""""""""""""""""""""""""""""
let mapleader = "\\\<Space>"
let maplocalleader = "\\"

""""""""""""""""""""""""""""""""""
"
" mapping
"
""""""""""""""""""""""""""""""""""
nnoremap gc :<C-u>!git<Space>
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" start from very magic mode
nnoremap / /\v
nnoremap ? ?\v
""""""""""""""""""""""""""""""""""
"
" appearance
"
""""""""""""""""""""""""""""""""""
set wildmenu


""""""""""""""""""""""""""""""""""
"
" character
"
""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileformats=unix,dos,mac
if !exists('g:vscode')
set ambiwidth=double
endif
""""""""""""""""""""""""""""""""""
"
" noswap 
"
""""""""""""""""""""""""""""""""""
set noswapfile

""""""""""""""""""""""""""""""""""
"
" terminal split in neovim 
"
""""""""""""""""""""""""""""""""""
if has('nvim')
  command! -nargs=* Term split | terminal <args>
  command! -nargs=* Termv vsplit | terminal <args>
endif
""""""""""""""""""""""""""""""""""
"
" runtime
"
""""""""""""""""""""""""""""""""""
runtime ftplugin/man.vim

""""""""""""""""""""""""""""""""""
"
" clipboard
"
""""""""""""""""""""""""""""""""""
xnoremap Y "+y

""""""""""""""""""""""""""""""""""
"
" commit spell check
"
""""""""""""""""""""""""""""""""""
set spelllang=en,cjk
autocmd FileType gitcommit setlocal spell
autocmd FileType gitcommit startinsert
hi clear SpellBad
hi SpellBad cterm=underline

""""""""""""""""""""""""""""""""""
"
" filetype
"
""""""""""""""""""""""""""""""""""
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.cjs set filetype=javascript.jsx
    au BufNewFile,BufRead *.yml,*.yaml set filetype=yaml
augroup END


""""""""""""""""""""""""""""""""""
"
" get group name of highlighting under cursor
"
""""""""""""""""""""""""""""""""""
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap gm :call SynGroup()<CR>


""""""""""""""""""""""""""""""""""
"
" autocmd
"
""""""""""""""""""""""""""""""""""
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END
"""""""""""""""""""""""""""""""""
"
" mouse
"
"""""""""""""""""""""""""""""""""
set mouse=a

"""""""""""""""""""""""""""""""""
"
" is plugged
"
"""""""""""""""""""""""""""""""""
function Is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction

"""""""""""""""""""""""""""""""""
"
" source all file in vim/
"
"""""""""""""""""""""""""""""""""
for f in split(glob('~/mydotfiles/vim/*.vim'), '\n')
    exe 'source' f
endfor
if has('nvim')
for f in split(glob('~/mydotfiles/vim/*.lua'), '\n')
    exe 'luafile' f
endfor
endif

"""""""""""""""""""""""""""""""""
"
" colorscheme
"
"""""""""""""""""""""""""""""""""

set termguicolors
if has('nvim')
  colorscheme molokai
elseif has('vim')
  colorscheme neodark
endif

"""""""""""""""""""""""""""""""""
"
" signcolumn
"
"""""""""""""""""""""""""""""""""
if has('nvim')
set signcolumn=yes:1
endif

"""""""""""""""""""""""""""""""""
"
" do not load unnecessary options
"
"""""""""""""""""""""""""""""""""
let g:did_install_default_menus = 1
let g:did_install_syntax_menu   = 1
let g:did_indent_on             = 1
let g:did_load_filetypes        = 1
let g:did_load_ftplugin         = 1
let g:loaded_2html_plugin       = 1
let g:loaded_gzip               = 1
let g:loaded_man                = 1
let g:loaded_matchit            = 1
let g:loaded_matchparen         = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_remote_plugins     = 1
let g:loaded_shada_plugin       = 1
let g:loaded_spellfile_plugin   = 1
let g:loaded_tarPlugin          = 1
let g:loaded_tutor_mode_plugin  = 1
let g:loaded_zipPlugin          = 1
let g:skip_loading_mswin        = 1

"""""""""""""""""""""""""""""""""
"
" lazy load
"
"""""""""""""""""""""""""""""""""
function! s:LazyLoadPlugs(timer) abort
if has('nvim')
  " save current position by marking Z because plug#load reloads current buffer
  normal! mZ
  call plug#load(
        \   'nvim-tree.lua',
  		\	'telescope.nvim'
        \ )
  normal! g`Z
  delmarks Z
endif

if has('nvim')
  for f in split(glob('~/mydotfiles/vim/after/*.lua'), '\n')
  	exe 'luafile' f
  endfor
endif

endfunction

call timer_start(1000, function("s:LazyLoadPlugs"))
