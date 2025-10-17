return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fr",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},

		opts = {
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			formatters = {
				["clang-format"] = {
					prepend_args = {
						"--style={PointerAlignment: Left, DerivePointerAlignment: false, IndentWidth: 4, ColumnLimit: 80}",
					},
				},
				["prettier"] = {
					prepend_args = {
						"--tab-width 4",
					},
				},
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
}
