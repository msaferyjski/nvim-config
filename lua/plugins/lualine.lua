return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local theme = require("lualine.themes.onedark")
			theme.normal.c.bg = "None"
			theme.inactive.c.bg = "None"

			require("lualine").setup({
				options = {
					theme = theme,
				},
			})
		end,
	},
}
