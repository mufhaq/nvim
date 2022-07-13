-- Telescope
vim.api.nvim_set_keymap(
	"n",
	"<leader>ff",
	":lua require('telescope.builtin').find_files()<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	":lua require('telescope.builtin').live_grep()<cr>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>fb",
	":lua require('telescope.builtin').buffers()<cr>",
	{ noremap = true, silent = true }
)

-- FZF
vim.api.nvim_set_keymap("n", "<C-p>", ":Files<cr>", { noremap = true, silent = false })
