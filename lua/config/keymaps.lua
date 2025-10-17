vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local map = vim.keymap.set

-- nvim
map("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", function ()
   vim.cmd("write")
end, { desc = "Save" })

-- auto-save
map("n", "<leader>as", ":ASToggle<CR>", {})

-- nvim-tree
map("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle file explorer" })

map("n", "<leader>t", function()
	require("nvim-tree.api").tree.open()
end, { desc = "Focus/Open file explorer" })

-- cokeline
map("n", "<S-tab>", "<Plug>(cokeline-focus-prev)", { desc = "Focus previous" })
map("n", "<tab>", "<Plug>(cokeline-focus-next)", { desc = "Focus next" })
map("n", "<leader>p", "<Plug>(cokeline-switch-prev)", { desc = "Switch previous" })
map("n", "<leader>n", "<Plug>(cokeline-switch-next)", { desc = "Switch next" })
map("n", "<C-c>", function()
	require("cokeline.buffers").get_current():delete()
end, { desc = "Close buffer" })

for i = 1, 9 do
	map("n", ("<F%s>"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i), { desc = "Focus Index" })
	map("n", ("<leader>%s"):format(i), ("<Plug>(cokeline-switch-%s)"):format(i), { desc = "Focus switch" })
end

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	map("t", "<esc>", [[<C-\><C-n>]], opts)
	map("t", "jk", [[<C-\><C-n>]], opts)
	map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
