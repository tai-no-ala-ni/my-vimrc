# :pushpin: my-vimrc :green_book:

## First of all

_If anything is unclear or strange, please write to [isuue](https://github.com/tai-no-ala-ni/my-vimrc/issues/new/choose)._

## How To Start

Clone this repository to your Home Directory

```bash
git clone git@github.com:tai-no-ala-ni/mydotfiles-public.git ~/mydotfiles
```

## :page_with_curl: Vim and Neovim :pencil2:

### :computer: Requirements :ledger:

- Neovim: 0.8+ or Vim 8.2+
- fzf
- deno
- luarocks
- nodejs,npm
- curl

Please install above packages and add your $PATH.

### :penguin: The things you need to do ( for Ubuntu 22.04 Users ) :bulb:

:one: :beginner: install Neovim :email:

```bash
curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb --create-dirs -o /tmp/nvim-deb/nvim-linux64.deb
sudo dpkg -i /tmp/nvim-dev/nvim-linux64.deb
```

:two: :beginner: or install Vim :email:

```bash
sudo apt update -y
sudo apt install -y vim
```

:three: :ticket: install dein.vim (Dark powered Vim/Neoim plugin manager) :helicopter:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
Please choose 2(local path)
```

:four: :bullettrain_front: install fzf,deno,luarocks,nodejs,npm,curl :nut_and_bolt:

```bash
sudo apt update -y
sudo apt install -y fzf luarocks nodejs npm curl
curl -fsSL https://deno.land/x/install/install.sh | sh
```

:five: :airplane: Make symlinks for .vimrc :bangbang:

```bash
ln -snfv ~/mydotfiles/.vimrc ~/.vimrc
ln -snfv ~/mydotfiles/.vimrc ~/.config/nvim/init.vim
```

:six: :rocket: Install packages for vim :skull:

```bash
vim
:call dein#install()
```

:seven: :tada: **Happy Editing!** :confetti_ball:

:eight: (Optional) you can add skk dictionary

```bash
mkdir -p ~/.skk
curl https://skk-dev.github.io/dict/SKK-JISYO.L.gz | gunzip -d - > ~/.skk/SKK-JISYO.L
```

### :apple: The things you need to do ( for Mac Users ) :bulb:

:one: :beginner: build nightly Neovim :email:

```bash
git clone git@github.com:neovim/neovim.git --branch=nightly --depth=1
make && sudo make install
```

:two: :beginner: or install NeoVim using brew :email:

```bash
brew install neovim --pre
```

:three: :ticket: install dein.vim (Dark powered Vim/Neoim plugin manager) :helicopter:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
Please choose 2(local path)
```

:four: :bullettrain_front: install fzf,deno,luarocks,nodejs,npm,curl :nut_and_bolt:

```bash
brew install fzf luarocks nodejs npm curl
curl -fsSL https://deno.land/x/install/install.sh | sh
```

:five: :airplane: Make symlinks for .vimrc :bangbang:

```bash
ln -snfv ~/mydotfiles/.vimrc ~/.vimrc
ln -snfv ~/mydotfiles/.vimrc ~/.config/nvim/init.vim
```

:six: :rocket: Install packages for vim :skull:

```bash
vim
:call dein#install()
```

:seven: :tada: **Happy Editing!** :confetti_ball:

:eight: (Optional) you can add skk dictionary

```bash
mkdir -p ~/.skk
curl https://skk-dev.github.io/dict/SKK-JISYO.L.gz | gunzip -d - > ~/.skk/SKK-JISYO.L
```

### :heavy_plus_sign: The things you need to do ( for Windows Users ) :bulb:

### :computer: Plugins descriptions :tokyo_tower:

- https://github.com/Shougo/pum.vim (popup window)
- https://github.com/vim-denops/denops.vim (deno plugin)
- https://github.com/Shougo/ddc.vim (completion)
- https://github.com/Shougo/ddc-around (ddc source for around words)
- https://github.com/LumaKernel/ddc-file (ddc source for filename)
- https://github.com/Shougo/ddc-matcher_head (matching filter)
- https://github.com/Shougo/ddc-sorter_rank (sorting filter)
- https://github.com/Shougo/ddc-converter_remove_overlap (removes overlapped text)
- https://github.com/Shougo/ddc-omni (omni completion)
- https://github.com/Shougo/ddc-ui-native (source for ui. i don't know what it is but this is needed)
- https://github.com/vim-skk/skkeleton (input method for vim)
- https://github.com/junegunn/fzf (fuzzy finder)
- https://github.com/junegunn/fzf.vim (fuzzy file finder for vim)
- https://github.com/neovim/nvim-lspconfig (neovim lsp)
- https://github.com/williamboman/mason.nvim (neovim lsp manager)
- https://github.com/williamboman/mason-lspconfig.nvim (easier setting tool for neovim lsp)
- https://github.com/jose-elias-alvarez/null-ls.nvim (inject lsp formatting,diagnostics,code action,and more)
- https://github.com/Shougo/ddc-nvim-lsp (ddc source for neovim lsp)
- https://github.com/lukas-reineke/virt-column.nvim (Display a character as the colorcolumn.)
- https://github.com/folke/lsp-colors.nvim (lsp diagnostics highlight group)
- https://github.com/tai-no-ala-ni/molomolokaikai (my colorscheme forked from molokai)
- https://github.com/AlessandroYorba/Alduin (colorscheme)
- https://github.com/lewis6991/gitsigns.nvim (github signs in signcolumn)
- https://github.com/norcalli/nvim-colorizer.lua (highlights hex rgb text)
- https://github.com/nvim-lua/plenary.nvim (lua function wrapper)
- https://github.com/nvim-telescope/telescope.nvim (super cool fuzzy file finder)
- https://github.com/folke/which-key.nvim (show keybindings)
- https://github.com/rcarriga/nvim-notify (add notification animations)
- https://github.com/kyazdani42/nvim-web-devicons (icons like material icons)
- https://github.com/nvim-tree/nvim-tree.lua (file explorer written in lua)
- https://github.com/romgrk/barbar.nvim (show tab bars)
- https://github.com/liuchengxu/vim-which-key (which key for vim)
- https://github.com/prabirshrestha/vim-lsp (lsp manager and settings for vim)
- https://github.com/mattn/vim-lsp-settings (lsp installer for vim)
- https://github.com/shun/ddc-vim-lsp (ddc source for vim lsp)
- https://github.com/lervag/vimtex (latex plugin for vim)
- https://github.com/vim-jp/vimdoc-ja (japanese vim help)
- https://github.com/matsui54/denops-signature_help (show help from lsp server)
- https://github.com/matsui54/denops-popup-preview.vim (show completion documentation)
- https://github.com/Shougo/neco-vim (ddc source for vimscript)
- https://github.com/itchyny/lightline.vim (statusline)
- https://github.com/Shougo/neosnippet.vim (snippet plugin)
- https://github.com/Shougo/neosnippet-snippets (snippet files for neosnippet)
- https://github.com/Shougo/vimproc.vim (asynchronous execution library for vim)
- https://github.com/mattn/emmet-vim (html completion)
- https://github.com/ekalinin/dockerfile.vim (dockerfile snippets for snipMate)
- https://github.com/github/copilot.vim (github copilot for vim)
- https://github.com/wakatime/vim-wakatime (correct coding record)
- https://github.com/chrisbra/csv.vim (provides csv utils)
- https://github.com/cohama/agit.vim (use git from vim)
- https://github.com/tyru/open-browser.vim (open browser from vim)
- https://github.com/tyru/open-browser-github.vim (open github page)
- https://github.com/dhruvasagar/vim-table-mode (provides table utils)
- https://github.com/mattn/webapi-vim (provides interface to web APIs)
- https://github.com/mattn/vim-gist (make gist from vim)
- https://github.com/ctrlpvim/ctrlp.vim (fuzzy file finder)
- https://github.com/KeitaNakamura/neodark.vim (colorscheme)
- https://github.com/preservim/tagbar (show ctags)
- https://github.com/jacquesbh/vim-showmarks (show marks in signcolumn)
- https://github.com/jiangmiao/auto-pairs (insert or delete brackets, parens, quotes in pair)
- https://github.com/tpope/vim-surround (surround utilities)
- https://github.com/kana/vim-textobj-user (create user defined text objects)
- https://github.com/osyo-manga/vim-textobj-blockwise (user defined text objects)
- https://github.com/thinca/vim-textobj-between (user defined text objects)
- https://github.com/kana/vim-operator-user (user defined operator)
- https://github.com/kana/vim-operator-replace (replace operator)
- https://github.com/junegunn/goyo.vim (zen mode)
- https://github.com/tpope/vim-fugitive (git for vim)
- https://github.com/rbong/vim-flog (show git log)
- https://github.com/jparise/vim-graphql (graphql filetype,sytax highlighting,indentation)
- https://github.com/iamcco/markdown-preview.nvim (super cool markdown previewer)
- https://github.com/skanehira/denops-translate.vim (translate)
- https://github.com/evanleck/vim-svelte (svelte syntax highlighting)
- https://github.com/wsdjeg/dein-ui.vim (UI for dein.vim)

### Plugins not used

- https://github.com/rhysd/github-complete.vim (complete emoji,user name,repository name,issue number,link using github api)
