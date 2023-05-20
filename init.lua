vim.opt.compatible = false

local dein_base = vim.fs.normalize("~/.local/share/dein")

local dein_src = vim.fs.normalize("~/.local/share/dein/repos/github.com/Shougo/dein.vim")

local dein_dir = vim.fn.expand(vim.g["dein_dir"] or dein_base)

vim.opt.runtimepath:append(dein_src)

local dein = require("dein")
dein.setup({
	auto_remote_plugins = false,
	enable_notification = true,
	auto_recache = true,
})

dein.begin(dein_dir)

dein.add(dein_src)

dein.add("Shougo/pum.vim", {
	lazy = 1,
	on_event = "VimEnter",
}) -- popup window
if vim.fn.executable("deno") == 1 then
	dein.add("vim-denops/denops.vim", {
		lazy = 1,
		on_event = "VimEnter",
		hook_post_source = "source ~/mydotfiles/vim/after/denops.vim",
	}) -- deno
	dein.add("wsdjeg/dein-ui.vim", {
		lazy = 1,
		on_event = "VimEnter",
	})
	dein.add("Shougo/ddc.vim", {
		lazy = 1,
		hook_post_source = "source ~/mydotfiles/vim/after/ddc.vim",
		depends = { "denops.vim" },
		-- on_event= 'VimEnter'
	}) -- ddc auto complete
	dein.add("Shougo/ddc-around", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- around cursor completion for ddc.vim
	dein.add("LumaKernel/ddc-file", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- filename complete
	dein.add("Shougo/ddc-matcher_head", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- heading matcher for ddc.vim
	dein.add("Shougo/ddc-sorter_rank", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- matched rank order sorter for ddc.vim
	dein.add("Shougo/ddc-converter_remove_overlap", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- no double complete
	dein.add("Shougo/ddc-omni", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- omnifunc completion for ddc
	dein.add("Shougo/ddc-ui-native", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- native ui for ddc
	dein.add("tani/ddc-fuzzy", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- fuzzy matching filters for ddc.vim
	dein.add("matsui54/ddc-dictionary", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	}) -- dictionary complete (for ddc)
	dein.add("Shougo/ddc-source-nvim-lsp", {
		lazy = 1,
		depends = { "ddc.vim" },
		on_event = "VimEnter",
	})
	--call dein.add('vim-skk/skkeleton', {
	-- lazy= 1,
	-- depends= {'denops.vim'},
	--" on_event= 'VimEnter',
	-- hook_post_source= 'source ~/mydotfiles/vim/after/skkeleton.vim'
	--}) " skk (japanese input method for vim)
	dein.add("skanehira/denops-translate.vim", {
		lazy = 1,
		depends = { "denops.vim" },
		-- on_event= 'VimEnter',
		hook_post_source = "source ~/mydotfiles/vim/after/denops-translate.vim",
	}) -- translate
end
if vim.fn.executable("fzf") == 1 then
	--call dein.add('junegunn/fzf')
	dein.add("junegunn/fzf", {
		build = "fzf.install()",
	}) -- fzf
	dein.add("junegunn/fzf.vim") -- fzf
end
if vim.fn.has("nvim") == 1 then
	--for nvim
	dein.add("williamboman/mason.nvim", {
		lazy = 1,
		hook_post_source = "luafile ~/mydotfiles/vim/after/mason.lua",
		on_event = "VimEnter",
	}) -- lsp setting
	dein.add("neovim/nvim-lspconfig", {
		lazy = 1,
		depends = { "mason.nvim" },
		on_event = "VimEnter",
	}) -- language server protocol
	dein.add("williamboman/mason-lspconfig.nvim", {
		lazy = 1,
		depends = { "mason.nvim" },
		on_event = "VimEnter",
	}) -- lsp setting
	dein.add("jose-elias-alvarez/null-ls.nvim", {
		lazy = 1,
		depends = { "mason.nvim" },
		hook_post_source = "luafile ~/mydotfiles/vim/after/null-ls.lua",
		on_event = "VimEnter",
	}) -- linter and formatter
	dein.add("Shougo/ddc-nvim-lsp", {
		lazy = 1,
		depends = { "mason.nvim", "ddc.vim" },
		-- on_event= 'VimEnter'
	}) -- lsp for nvim
	dein.add("folke/lsp-colors.nvim", {
		lazy = 1,
		depends = { "mason.nvim" },
		hook_post_source = "luafile ~/mydotfiles/vim/after/lsp-colors.lua",
		on_event = "VimEnter",
	}) -- lsp colors
	dein.add("lukas-reineke/virt-column.nvim") -- set virtual text color?
	dein.add("tai-no-ala-ni/molomolokaikai") -- molomolokaikai colorscheme
	dein.add("AlessandroYorba/Alduin") -- Alduin color
	dein.add("lewis6991/gitsigns.nvim") -- gitsigns
	dein.add("norcalli/nvim-colorizer.lua") -- colorizer
	dein.add("nvim-lua/plenary.nvim") -- lua function
	if vim.fn.has("win32") == 0 and vim.fn.has("win64") == 0 then
		dein.add("nvim-telescope/telescope.nvim", {
			lazy = 1,
			hook_post_source = "luafile ~/mydotfiles/vim/after/telescope.lua",
			on_event = "VimEnter",
		}) -- telescope
	end
	dein.add("folke/which-key.nvim") -- which-key
	dein.add("rcarriga/nvim-notify") -- notify
	dein.add("kyazdani42/nvim-web-devicons") -- icon
	--call dein.add('nvim-tree/nvim-tree.lua')
	dein.add("nvim-tree/nvim-tree.lua", {
		lazy = 1,
		hook_post_source = "luafile ~/mydotfiles/vim/after/nvim-tree.lua",
		on_event = "VimEnter",
	}) -- file tree
	dein.add("romgrk/barbar.nvim") -- tabline
	--call dein.add('nvim-treesitter/nvim-treesitter', {'do'= ':TSUpdate')} " treesitter
	--call dein.add('rcarriga/nvim-notify') " notify
	--call dein.add('MunifTanjim/nui.nvim') " ui
	--call dein.add('folke/noice.nvim') " change view of messages,cmdline,popupmenu
	--call dein.add('iamcco/markdown-preview.nvim')
	dein.add("iamcco/markdown-preview.nvim", {
		build = 'sh -c --cd app && npm install"',
		on_ft = "markdown",
	})
--call dein.add('eandrju/cellular-automaton.nvim') " relax animation
else
	-- for vim
	dein.add("liuchengxu/vim-which-key") -- which-key
	dein.add("prabirshrestha/vim-lsp") -- language server protocol
	dein.add("mattn/vim-lsp-settings") -- lsp setting
	dein.add("shun/ddc-vim-lsp") -- vim-lsp for ddc.vim
	dein.add("lervag/vimtex") -- vim tex
	dein.add("akinsho/bufferline.nvim") -- bufferline
end
-- vim/nvim
dein.add("evanleck/vim-svelte", {
	on_ft = "svelte",
}) -- svelte syntax highlight
--call dein.config('vim-svelte',  {
-- on_ft= 'svelte'
-- }) " svelte syntax highlight
dein.add("vim-jp/vimdoc-ja") -- vim help in japanese
dein.add("matsui54/denops-signature_help", {
	lazy = 1,
	depends = { "denops.vim" },
	-- on_event= 'VimEnter',
	hook_post_source = "source ~/mydotfiles/vim/after/denops-signature_help.vim",
}) -- shows signature help from lsp server
dein.add("matsui54/denops-popup-preview.vim", {
	lazy = 1,
	depends = { "denops.vim" },
	-- on_event= 'VimEnter',
	hook_post_source = "source ~/mydotfiles/vim/after/denops-popup-preview.vim",
}) -- denops popup preview
dein.add("Shougo/neco-vim") -- Vim completion source
dein.add("itchyny/lightline.vim") -- good status line
dein.add("Shougo/neosnippet.vim")
dein.add("Shougo/neosnippet-snippets")
dein.add("Shougo/vimproc") -- async
dein.config("vimproc", {
	build = "make",
}) -- async
dein.add("mattn/emmet-vim", {
	lazy = 1,
	on_ft = { "html", "css", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte", "vue" },
	hook_post_source = "source ~/mydotfiles/vim/after/emmet.vim",
}) -- html emmet
dein.add("ekalinin/dockerfile.vim") -- dockerfile syntax
dein.add("github/copilot.vim") -- copilot
dein.add("wakatime/vim-wakatime") -- wakatime
dein.add("chrisbra/csv.vim") -- csv
dein.add("cohama/agit.vim") -- agit
dein.add("tyru/open-browser.vim") -- open-browser
dein.add("tyru/open-browser-github.vim") -- open-browser-github
dein.add("dhruvasagar/vim-table-mode") -- write markdown table
--call dein.add('rhysd/github-complete.vim') " github complete
dein.add("mattn/webapi-vim") -- webapi
dein.add("mattn/vim-gist") -- use gist from vim
dein.add("ctrlpvim/ctrlp.vim") -- selecter
dein.add("KeitaNakamura/neodark.vim") -- neodark
dein.add("preservim/tagbar") -- tagbar
dein.add("jacquesbh/vim-showmarks") -- show mark
dein.add("jiangmiao/auto-pairs") -- auto-pairs
dein.add("tpope/vim-surround") -- surround
dein.add("kana/vim-textobj-user", {
	lazy = 1,
	hook_post_source = "source ~/mydotfiles/vim/after/vim-textobj.vim",
}) -- user defined textobj
dein.add("osyo-manga/vim-textobj-blockwise", {
	lazy = 1,
	depends = { "vim-textobj-user" },
}) -- cIw and <C-v>iw
dein.add("thinca/vim-textobj-between", {
	lazy = 1,
	depends = { "vim-textobj-user" },
}) -- textobj between word
dein.add("kana/vim-operator-user") -- user defined operator
dein.add("kana/vim-operator-replace") -- replace operator
--call dein.add('itchyny/calendar.vim')	" calendar
dein.add("junegunn/goyo.vim") -- goyo
dein.add("tpope/vim-fugitive") -- git wrapper
dein.add("rbong/vim-flog") -- git log graph
dein.add("jparise/vim-graphql") -- graphql
-- Finish Dein initialization (required)
dein.end_()

-- autocmd VimEnter * call dein#call_hook('post_source')
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		dein.call_hook("post_source")
	end,
})

if vim.fn.has("filetype") then
	vim.cmd("filetype plugin indent on")
end

if vim.fn.has("syntax") then
	vim.cmd("syntax on")
end

if dein.check_install() == 1 then
	dein.install()
end

-- indent setting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- font
vim.opt.guifont = "HackGenNerdConsole-Regular:h12"
vim.opt.guifontwide = "HackGenNerdConsole-Regular:h12"

-- hilight
-- vim.cmd("highlight Pmenu ctermfg=81 ctermbg=8 guifg=#66D9EF guibg=#303548")
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#66D9EF", bg = "#303548", ctermfg = 81, ctermbg = 8 })

-- leader backslash and space
vim.g.mapleader = "\\ "
vim.g.maplocalleader = "\\"

-- mapping
vim.api.nvim_set_keymap("n", "gc", ":<C-u>!git<Space>", { noremap = true })
if vim.fn.has("conceal") == 1 then
	vim.opt.conceallevel = 2
	vim.opt.concealcursor = "niv"
end

vim.api.nvim_set_keymap("n", "/", "/\\v", { noremap = true })
vim.api.nvim_set_keymap("n", "?", "?\\v", { noremap = true })

-- appearance
vim.opt.wildmenu = true

-- character
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }
if vim.fn.exists("g:vscode") == 1 then
	vim.opt.ambiwidth = "double"
end

-- noswap
vim.opt.swapfile = false

-- terminal split in neovim
--if vim.fn.has("nvim") == 1 then
--	vim.cmd("command! -nargs=* Term split| terminal")
--	vim.cmd("command! -nargs=* Termv vsplit | terminal")
--end

-- runtime
vim.cmd("runtime ftplugin/man.vim")

-- clipboard
vim.api.nvim_set_keymap("n", "Y", '"+y', { noremap = true })

-- commit spell check
--vim.opt.spelllang = { "en", "cjk" }
--vim.api.nvim_create_autocmd("FileType gitcommit", {
--	callback = function()
--		vim.opt_local.spell = true
--	end,
--})
--vim.api.nvim_create_autocmd("FileType gitcommit", {
--	callback = function()
--		vim.cmd([[ autocmd FileType gitcommit startinsert ]])
--	end,
--})
--vim.api.nvim_set_hl(0, "SpellBad", { cterm = underline })

-- filetype
vim.api.nvim_create_augroup("FiletypeGroup", { clear = true })
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.cjs",
	callback = function()
		vim.opt.filetype = "javascript.jsx"
	end,
})
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.yml,*.yaml",
	callback = function()
		vim.opt.filetype = "yaml"
	end,
})

-- get group name of highlighting under cursor
function SynGroup()
	print(vim.fn.synIDattr(vim.fn.synID(vim.fn.line("."), vim.fn.col("."), 1), "name"))
end
vim.api.nvim_set_keymap("n", "gm", ":call SynGroup()<CR>", { noremap = true })

-- jump to last edit position
vim.api.nvim_create_augroup("LastEditPosition", { clear = true })
vim.api.nvim_create_autocmd("BufRead", {
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})

-- mouse
vim.opt.mouse = "a"

-- is plugged
--function Is_plugged(name)
--	return vim.fn.empty(vim.fn.glob(vim.fn.expand("~/.cache/dein/repos/github.com/" .. name))) == 0
--end
vim.cmd([[
function! Is_plugged(name)
    if exists('g:plugs') && has_key(g:plugs, a:name) && isdirectory(g:plugs[a:name].dir)
        return 1
    else
        return 0
    endif
endfunction
]])

-- source all files in vim
vim.cmd([[
for f in split(glob('~/mydotfiles/vim/*.vim'), '\n')
    exe 'source' f
endfor
if has('nvim')
for f in split(glob('~/mydotfiles/vim/*.lua'), '\n')
    exe 'luafile' f
endfor
]])

-- colorscheme
vim.opt.termguicolors = true
if vim.fn.has("nvim") == 1 then
	vim.cmd("colorscheme molokai")
else
	vim.cmd("colorscheme neodark")
end

-- signcolumn
if vim.fn.has("nvim") == 1 then
	vim.opt.signcolumn = "yes:1"
end

-- do not load unnecessary options
vim.api.nvim_set_var("did_install_default_menus", 1)
vim.api.nvim_set_var("did_install_syntax_menu", 1)
vim.api.nvim_set_var("did_indent_on", 1)
vim.api.nvim_set_var("did_load_filetypes", 1)
vim.api.nvim_set_var("did_load_ftplugin", 1)
vim.api.nvim_set_var("loaded_2html_plugin", 1)
vim.api.nvim_set_var("loaded_gzip", 1)
vim.api.nvim_set_var("loaded_man", 1)
vim.api.nvim_set_var("loaded_matchit", 1)
vim.api.nvim_set_var("loaded_matchparen", 1)
vim.api.nvim_set_var("loaded_netrwPlugin", 1)
vim.api.nvim_set_var("loaded_remote_plugins", 1)
vim.api.nvim_set_var("loaded_shada_plugin", 1)
vim.api.nvim_set_var("loaded_spellfile_plugin", 1)
vim.api.nvim_set_var("loaded_tarPlugin", 1)
vim.api.nvim_set_var("loaded_tutor_mode_plugin", 1)
vim.api.nvim_set_var("loaded_zipPlugin", 1)
vim.api.nvim_set_var("skip_loading_mswin", 1)

-- remove disable plugins
vim.cmd([[
function! RemoveDisabledPlugins()
	call map(dein#check_clean(), { _, val -> delete(val, 'rf') })
	call dein#recache_runtimepath()
	echo('Disabled plugins are removed.')
endfunction
nnoremap <silent> <leader>rdp :<C-u>call RemoveDisabledPlugins()<CR>
]])
