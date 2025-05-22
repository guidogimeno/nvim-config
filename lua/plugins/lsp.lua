return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{ "j-hui/fidget.nvim", opts = {} },
			{
				"stevearc/conform.nvim",
				opts = {
					formatters_by_ft = {
						lua = { "stylua" },
						go = { "gofmt" },
						javascript = { "prettier" },
						typescript = { "prettier" },
					},
					format_on_save = {
						timeout_ms = 500,
						lsp_fallback = true,
					},
				},
			},
		},
		config = function()
			-- LSP attach autocommand
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc, mode)
						mode = mode or "n"
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					-- LSP keymaps
					map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
					map("gr", vim.lsp.buf.references, "[G]oto [R]eferences")
					map("gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
					map("gh", vim.lsp.buf.hover, "[G]oto [H]over")
					map("<leader>vca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
					map("vrn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>f", function()
						require("conform").format({ async = true, lsp_fallback = true })
					end, "[F]ormat")
				end,
			})

			-- LSP capabilities with nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- LSP server configurations
			local servers = {
				gopls = {
					settings = {
						gopls = {
							analyses = { unusedparams = true },
							staticcheck = true,
						},
					},
				},
				ts_ls = {},
				lua_ls = {
					settings = {
						Lua = {
							completion = { callSnippet = "Replace" },
							diagnostics = {
								globals = { "vim" },
								disable = { "missing-fields" },
							},
						},
					},
				},
			}

			-- Mason setup
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "lua_ls", "ts_ls" },
			})

			-- Configure each LSP server
			local lspconfig = require("lspconfig")
			for server_name, server_config in pairs(servers) do
				server_config.capabilities =
					vim.tbl_deep_extend("force", {}, capabilities, server_config.capabilities or {})
				lspconfig[server_name].setup(server_config)
			end
		end,
	},
}
