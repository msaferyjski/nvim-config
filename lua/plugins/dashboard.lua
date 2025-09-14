return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "doom",
				config = {
					header = {
						"╔═╗ ╔╗╔═══╗╔═══╗╔╗  ╔╗╔══╗╔═╗╔═╗",
						"║║╚╗║║║╔══╝║╔═╗║║╚╗╔╝║╚╣╠╝║║╚╝║║",
						"║╔╗╚╝║║╚══╗║║ ║║╚╗║║╔╝ ║║ ║╔╗╔╗║",
						"║║╚╗║║║╔══╝║║ ║║ ║╚╝║  ║║ ║║║║║║",
						"║║ ║║║║╚══╗║╚═╝║ ╚╗╔╝ ╔╣╠╗║║║║║║",
						"╚╝ ╚═╝╚═══╝╚═══╝  ╚╝  ╚══╝╚╝╚╝╚╝",
						"                                ",
						"                                ",
					},
					center = {
						{
							icon = " ",
							desc = "Recent Projects",
							key = "p",
							action = "Telescope projects",
						},
						{
							icon = " ",
							desc = "Find File",
							key = "f",
							action = "Telescope find_files",
						},
						{
							icon = " ",
							desc = "Recent Files",
							key = "r",
							action = "Telescope oldfiles",
						},
						{
							icon = " ",
							desc = "Edit Config",
							key = "c",
							action = function()
								vim.cmd("cd " .. vim.fn.stdpath("config"))
								require("telescope.builtin").find_files()
							end,
						},
						{
							icon = " ",
							desc = "Quit",
							key = "q",
							action = "qa",
						},
					},
					vertical_center = true,
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
