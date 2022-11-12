require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
local mason_lspconfig = require("mason-lspconfig")
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dof", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>dgp", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dgn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dsl", vim.diagnostic.setloclist, opts)

mason_lspconfig.setup_handlers({
	function(server_name)
		local mason_opts = {}

		-- Use an on_attach function to only map the following keys
		-- after the language server attaches to the current buffer
		mason_opts.on_attach = function(client, bufnr)
			-- Enable completion triggered by <c-x><c-o>
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

			-- Mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
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
			vim.keymap.set("n", "<leader>lfm", vim.lsp.buf.format, bufopts)
			vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, bufopts)
		end

		if server_name == "sumneko_lua" then
			mason_opts.settings = { Lua = { diagnostics = { globals = { "vim" } } } }
		end
		require("lspconfig")[server_name].setup(mason_opts)
	end,
})

-- vim.api.nvim_create_autocmd({"BufWritePre"}, {
--     callback = function() vim.lsp.buf.format {async = true} end
-- })

-- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])

vim.api.nvim_set_option("updatetime", 500)

vim.cmd([[autocmd CursorHold <buffer> lua vim.diagnostic.open_float({focusable = false})]])
