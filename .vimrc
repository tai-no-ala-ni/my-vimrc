" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = expand('~/.local/share/dein')

" Set Dein source path (required)
let s:dein_src = expand('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

call dein#add('wsdjeg/dein-ui.vim')
call dein#add('Shougo/pum.vim') " popup window
if executable('deno')
call dein#add('vim-denops/denops.vim') " deno
call dein#add('Shougo/ddc.vim',#{
\ lazy: 1,
\ hook_source: 'source ~/mydotfiles/vim/after/ddc.vim',
\ on_event: 'VimEnter'
\}) " ddc auto complete
call dein#add('Shougo/ddc-around',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " around cursor completion for ddc.vim
call dein#add('LumaKernel/ddc-file',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " filename complete
call dein#add('Shougo/ddc-matcher_head',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " heading matcher for ddc.vim
call dein#add('Shougo/ddc-sorter_rank',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " matched rank order sorter for ddc.vim
call dein#add('Shougo/ddc-converter_remove_overlap',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " no double complete
call dein#add('Shougo/ddc-omni',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " omnifunc completion for ddc
call dein#add('Shougo/ddc-ui-native',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " native ui for ddc
call dein#add('tani/ddc-fuzzy',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " fuzzy matching filters for ddc.vim
call dein#add('matsui54/ddc-dictionary',#{
\ lazy: 1,
\ depends: ['Shougo/ddc.vim'],
\}) " dictionary complete (for ddc)
call dein#add('vim-skk/skkeleton') " skk (japanese input method for vim)
call dein#add('skanehira/denops-translate.vim') " translate
endif
if executable('fzf')
"call dein#add('junegunn/fzf')
call dein#add('junegunn/fzf', #{
\ build: 'fzf#install()'
\ })  " fzf
call dein#add('junegunn/fzf.vim') " fzf
endif
if has('nvim')
"for nvim
call dein#add('williamboman/mason.nvim',#{
\ lazy: 1,
\ hook_post_source: 'luafile ~/mydotfiles/vim/after/mason.lua',
\ on_event: 'InsertEnter'
\}) " lsp setting
call dein#add('neovim/nvim-lspconfig', #{
\lazy: 1,
\depends: ['williamboman/mason.nvim'],
\}) " language server protocol
call dein#add('williamboman/mason-lspconfig.nvim',#{
\ lazy: 1,
\ depends: ['williamboman/mason.nvim'],
\}) " lsp setting
call dein#add('jose-elias-alvarez/null-ls.nvim',#{
\ lazy: 1,
\ depends: ['williamboman/mason.nvim'],
\ hook_post_source: 'luafile ~/mydotfiles/vim/after/null-ls.lua'
\}) " linter and formatter
call dein#add('Shougo/ddc-nvim-lsp',#{
\ lazy: 1,
\ depends: ['williamboman/mason.nvim','Shougo/ddc.vim'],
\}) " lsp for nvim
call dein#add('folke/lsp-colors.nvim',#{
\ lazy: 1,
\ depends: ['williamboman/mason.nvim'],
\ hook_post_source: 'luafile ~/mydotfiles/vim/after/lsp-colors.lua'
\}) " lsp colors
call dein#add('lukas-reineke/virt-column.nvim') " set virtual text color?
call dein#add('tai-no-ala-ni/molomolokaikai') " molomolokaikai colorscheme
call dein#add('AlessandroYorba/Alduin') " Alduin color
call dein#add('lewis6991/gitsigns.nvim') " gitsigns
call dein#add('norcalli/nvim-colorizer.lua') " colorizer
call dein#add('nvim-lua/plenary.nvim') " lua function
call dein#add('nvim-telescope/telescope.nvim',#{
\lazy: 1,
\ hook_post_source: 'luafile ~/mydotfiles/vim/after/telescope.lua',
\ on_event: 'VimEnter'
\}) " telescope
call dein#add('folke/which-key.nvim') " which-key
call dein#add('rcarriga/nvim-notify') " notify
call dein#add('kyazdani42/nvim-web-devicons') " icon
"call dein#add('nvim-tree/nvim-tree.lua')
call dein#add('nvim-tree/nvim-tree.lua',#{
\lazy: 1,
\hook_post_source: 'luafile ~/mydotfiles/vim/after/nvim-tree.lua',
\on_event: 'VimEnter'
\}) " file tree
call dein#add('romgrk/barbar.nvim') " tabline
"call dein#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate')} " treesitter
"call dein#add('rcarriga/nvim-notify') " notify
"call dein#add('MunifTanjim/nui.nvim') " ui
"call dein#add('folke/noice.nvim') " change view of messages,cmdline,popupmenu
"call dein#add('iamcco/markdown-preview.nvim') 
call dein#add('iamcco/markdown-preview.nvim', #{
\ build: 'sh -c "cd app && npm install"' ,
\ on_ft: 'markdown',
\ })
"call dein#add('eandrju/cellular-automaton.nvim') " relax animation
else
" for vim
call dein#add('liuchengxu/vim-which-key') " which-key
call dein#add('prabirshrestha/vim-lsp') " language server protocol
call dein#add('mattn/vim-lsp-settings') " lsp setting
call dein#add('shun/ddc-vim-lsp') " vim-lsp for ddc.vim
call dein#add('lervag/vimtex') " vim tex
endif
" vim/nvim
call dein#add('evanleck/vim-svelte') " svelte syntax highlight
call dein#config('vim-svelte', #{
\ on_ft: 'svelte'
\ }) " svelte syntax highlight
call dein#add('vim-jp/vimdoc-ja') " vim help in japanese
call dein#add('matsui54/denops-signature_help') " shows signature help from lsp server
call dein#add('matsui54/denops-popup-preview.vim') " denops popup preview
call dein#add('Shougo/neco-vim') " Vim completion source
call dein#add('itchyny/lightline.vim') " good status line
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/vimproc') " async
call dein#config('vimproc', #{
\ build: 'make'
\ }) " async
call dein#add('mattn/emmet-vim') " html emmet
call dein#add('ekalinin/dockerfile.vim') " dockerfile syntax
call dein#add('github/copilot.vim') " copilot
call dein#add('wakatime/vim-wakatime') " wakatime
call dein#add('chrisbra/csv.vim') " csv
call dein#add('cohama/agit.vim') " agit
call dein#add('tyru/open-browser.vim') " open-browser
call dein#add('tyru/open-browser-github.vim') " open-browser-github
call dein#add('dhruvasagar/vim-table-mode') " write markdown table
"call dein#add('rhysd/github-complete.vim') " github complete
call dein#add('mattn/webapi-vim') " webapi
call dein#add('mattn/vim-gist') " use gist from vim
call dein#add('ctrlpvim/ctrlp.vim') " selecter
call dein#add('KeitaNakamura/neodark.vim') " neodark
call dein#add('preservim/tagbar') " tagbar
call dein#add('jacquesbh/vim-showmarks') " show mark
call dein#add('jiangmiao/auto-pairs') " auto-pairs
call dein#add('tpope/vim-surround') " surround
call dein#add('kana/vim-textobj-user') " user defined textobj
call dein#add('osyo-manga/vim-textobj-blockwise') " cIw and <C-v>iw
call dein#add('thinca/vim-textobj-between') " textobj between word
call dein#add('kana/vim-operator-user') " user defined operator
call dein#add('kana/vim-operator-replace') " replace operator
"call dein#add('itchyny/calendar.vim')	" calendar
call dein#add('junegunn/goyo.vim')	" goyo
call dein#add('tpope/vim-fugitive') " git wrapper
call dein#add('rbong/vim-flog') " git log graph
call dein#add('jparise/vim-graphql') " graphql
" Finish Dein initialization (required)

call dein#end()

" call hook source
autocmd VimEnter * call dein#call_hook('post_source')

" auto upodate
let g:dein#auto_update = 1

if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Uncomment if you want to install not-installed plugins on startup.
"if dein#check_install()
" call dein#install()
"endif

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
"function! s:LazyLoadPlugs(timer) abort
"if has('nvim')
"  for f in split(glob('~/mydotfiles/vim/after/*.lua'), '\n')
"  	exe 'luafile' f
"  endfor
"endif
"
"endfunction
"
"call timer_start(1000, function("s:LazyLoadPlugs"))
