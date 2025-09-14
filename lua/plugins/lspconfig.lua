return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
			{
				"saghen/blink.cmp",
				dependencies = { "rafamadriz/friendly-snippets" },
				version = "1.*",
				opts = {
					keymap = {
						preset = "default",
						["<CR>"] = { "select_and_accept", "fallback" },
					},
					appearance = {
						nerd_font_variant = "mono",
					},

					completion = { documentation = { auto_show = false } },
					sources = {
						default = { "lazydev", "lsp", "path", "snippets", "buffer" },
						providers = {
							lazydev = {
								name = "LazyDev",
								module = "lazydev.integrations.blink",
								score_offset = 100,
							},
						},
					},
					fuzzy = { implementation = "prefer_rust_with_warning" },
				},
				opts_extend = { "sources.default" },
			},
		},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- disable annoying messages
			vim.lsp.config["jdtls"] = {
				handlers = {
					["language/status"] = function(_, _) end,
					["$/progress"] = function(_, _, _) end,
				},
			}

			-- configure all servers, they get automatically started by mason-lspconfig
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			local map = vim.keymap.set

			-- lsp binds
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					map("n", "gd", vim.lsp.buf.definition, { buffer = args.buf, desc = "Go to definition" })
					map("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf, desc = "Go to delcaration" })
					map("n", "gr", vim.lsp.buf.references, { buffer = args.buf, desc = "Go to references" })
					map("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf, desc = "Go to implementation" })
					map("n", "K", vim.lsp.buf.hover, { buffer = args.buf, desc = "Hover over" })
					map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = args.buf, desc = "Rename" })
					map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf, desc = "Perform code action" })
					map("n", "<leader>f", vim.diagnostic.open_float, { buffer = args.buf })
					map("n", "<leader>q", vim.diagnostic.setloclist, { buffer = args.buf })
				end,
			})
		end,
	},
}
