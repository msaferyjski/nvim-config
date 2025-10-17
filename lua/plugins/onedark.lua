return {
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000,
		config = function()
			local bg_color = "#ffffff"
			local success, json = pcall(vim.fn.readfile, os.getenv("HOME") .. "/.cache/wal/colors.json")

			if success and json then
				local decoded = vim.fn.json_decode(table.concat(json, "\n"))
				if decoded and decoded["special"] and decoded["special"]["background"] then
					bg_color = decoded["special"]["background"]
				end
			end

			require("onedarkpro").setup({
				colors = {
					bg = bg_color,
				},
			})
			vim.cmd("colorscheme onedark")
		end,
	},
}
