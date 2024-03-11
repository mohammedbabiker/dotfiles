return {
	-- Install the language server with Mason
	{
		"williamboman/mason.nvim",
		cmd = "Mason", -- load mason when running :Mason command
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- Enable communications between LSP config and Mason
	{
		"williamboman/mason-lspconfig.nvim",
		-- event = "VeryLazy", -- load this after critical plugins
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	-- LSP config keybindings and setup for different languages
	{
		"neovim/nvim-lspconfig",
		-- load lsp config when reading a buffer or creating a new one
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr) -- (client, bufnr)
				opts.buffer = bufnr
			end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local signs = { Error = "", Warn = "", Hint = "󰠠", Info = "" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local lspconfig = require("lspconfig") -- language server
			lspconfig.tsserver.setup({ -- javascript
				capabilites = capabilities,
				on_attach = on_attach,
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
			})
			lspconfig.html.setup({ -- html
				capabilites = capabilities,
				on_attach = on_attach,
			})
			lspconfig.lua_ls.setup({ -- lua
				capabilites = capabilities,
				on_attach = on_attach,
				setting = {
					lua = {
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = {
								-- runtime file path
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
			lspconfig.cssls.setup({ -- css
				capabilites = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tailwindcss.setup({
				capabilites = capabilities,
				on_attach = on_attach,
			})
			lspconfig.jsonls.setup({
				capabilites = capabilities,
				on_attach = on_attach,
			})
			lspconfig.emmet_ls.setup({
				capabilites = capabilities,
				on_attach = on_attach,
				-- filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
			})
			-- configure svelte server
			lspconfig.svelte.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					on_attach(client, bufnr)

					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							if client.name == "svelte" then
								client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
							end
						end,
					})
				end,
			})

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "I", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", "<CMD>Telescope lsp_references<CR>", {}) -- show definition, references
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
