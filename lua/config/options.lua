local opt = vim.opt

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.termguicolors = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.cursorline = true
opt.number = true
opt.relativenumber = true
opt.termguicolors = true

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp", "java" },
	callback = function()
		vim.bo.shiftwidth = 4
		vim.bo.tabstop = 4
		vim.bo.expandtab = true
	end,
})
