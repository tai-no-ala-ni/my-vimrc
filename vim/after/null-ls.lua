local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local helpers = require("null-ls.helpers")
-- added by nvim-notify
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

local prettier_formatting_source = formatting.prettierd.with({
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"html",
		"css",
		"scss",
		"less",
		"graphql",
		"vue",
		"svelte",
		"markdown",
	},
	timeout = 20000,
	prefer_local = "node_modules/.bin",
})

local eslint_formatting_source = formatting.eslint_d.with({
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"less",
		"graphql",
		"vue",
		"svelte",
	},
	timeout = 20000,
	prefer_local = "node_modules/.bin",
})

local lua_source = formatting.stylua.with({ filetypes = { "lua" } })

local eslint_diagnostics_source = diagnostics.eslint_d.with({
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"less",
		"graphql",
		"vue",
		"svelte",
	},
	prefer_local = "node_modules/.bin",
	timeout = 20000,
	diagnostics_postprocess = function(diagnostic)
		for _, d in ipairs(diagnostic) do
			vim.notify(d.message, vim.log.levels.ERROR)
			-- Notify(d.message)
		end
		return diagnostics
	end,
})

local latex_diagnostics_source = diagnostics.chktex.with({
	filetypes = { "tex" },
})
local latex_formatting_source = formatting.latexindent.with({
	filetypes = { "tex" },
})
local textlint_diagnotics_source = diagnostics.textlint.with({
	filetypes = { "tex" },
	prefer_local = "node_modules/.bin",
})
local textlint_formatting_source = formatting.textlint.with({
	filetypes = { "tex" },
	prefer_local = "node_modules/.bin",
})

local shellharden_formatting_source = formatting.shellharden.with({
	filetypes = { "sh", "zsh", "bash" },
})
local shellcheck_diagnotics_source = diagnostics.shellcheck.with({
	filetypes = { "sh", "zsh", "bash" },
})

local clang_format_formatting_source = formatting.clang_format.with({
	filetypes = { "c", "cpp", "objc", "objcpp" },
})

local python_diagnostics_source = diagnostics.pylint.with({
	filetypes = { "python" },
})

local python_formatting_source = formatting.black.with({
	filetypes = { "python" },
})

local golang_formatting_source = formatting.gofumpt.with({
	filetypes = { "go" },
})

local golang_imports_formatting_source = formatting.goimports.with({
	filetypes = { "go" },
})

local golangci_lint_diagnostics_source = diagnostics.golangci_lint.with({
	filetypes = { "go" },
})

local vint_lint_diagnostics_source = diagnostics.vint.with({
	filetypes = { "vim" },
})

local sources = {
	eslint_formatting_source,
	prettier_formatting_source,
	lua_source,
	eslint_diagnostics_source,
	latex_diagnostics_source,
	latex_formatting_source,
	textlint_diagnotics_source,
	--textlint_formatting_source,
	shellharden_formatting_source,
	shellcheck_diagnotics_source,
	clang_format_formatting_source,
	python_diagnostics_source,
	python_formatting_source,
	golang_formatting_source,
	golang_imports_formatting_source,
	golangci_lint_diagnostics_source,
	vint_lint_diagnostics_source,
}

null_ls.setup({
	ensure_installed = {
		"eslint_d",
		"prettierd",
		"lua-language-server",
		"luacheck",
		"stylua",
		"luaformatter",
		"chktex",
		"latexindent",
		"textlint",
		"shellharden",
		"shellcheck",
		"clangd",
		"texlab",
		"texlint",
		"typescript-language-server",
		"vim-language-server",
		"vint",
		"yaml-language-server",
		"gopls",
		"python-lsp-server",
		"pylint",
		"black",
		"gofumpt",
		"goimports",
	},
	debug = true,
	on_attach = on_attach,
	sources = sources,
})
