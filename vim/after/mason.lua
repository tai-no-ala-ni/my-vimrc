require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig v2.0+: setup_handlers() was removed.
-- Installed servers are now auto-enabled via vim.lsp.enable() (automatic_enable).
require("mason-lspconfig").setup({
	automatic_enable = true,
})

-- ddc lsp source (call once, not per-server)
pcall(function()
	require("ddc_source_lsp_setup").setup()
end)

-- diagnostics keymaps (global)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dof", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dgp", function()
	vim.diagnostic.jump({ count = -1 })
end, opts)
vim.keymap.set("n", "<leader>dgn", function()
	vim.diagnostic.jump({ count = 1 })
end, opts)
vim.keymap.set("n", "<leader>dsl", vim.diagnostic.setloclist, opts)

-- per-server config via Neovim 0.11 native API (replaces the old handler)
vim.lsp.config("lua_ls", {
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

-- on_attach: set buffer-local keymaps when any LSP attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Mappings. See `:help vim.lsp.*`
		local bufopts = { noremap = true, silent = true, buffer = bufnr }
		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, bufopts)
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, bufopts)
		vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, bufopts)
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, bufopts)
		vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>lrm", vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set("n", "<leader>ll", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, bufopts)
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, bufopts)
		vim.keymap.set("n", "<leader>lfm", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts)
		vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, bufopts)
	end,
})

vim.o.updatetime = 500

vim.cmd([[autocmd CursorHold <buffer> lua vim.diagnostic.open_float({focusable = false})]])
