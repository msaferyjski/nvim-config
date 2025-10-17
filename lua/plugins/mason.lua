return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			automatic_enable = {
				exclude = {
					"rust_analyzer",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		cmd = "MasonToolsInstall",
		opts = {
			ensure_installed = {
				"clang-format",
				"clangd",
				"cmake-language-server",
				"codelldb",
				"css-lsp",
				"html-lsp",
				"jdtls",
				"json-lsp",
				"lua-language-server",
				"rust_analyzer",
				"luau-lsp",
				"stylua",
			},
			auto_update = true,
		},
	},
}
