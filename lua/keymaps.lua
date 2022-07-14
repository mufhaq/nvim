local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Modes:
--  normal_mode         = 'n'
--  insert_mode         = 'i'
--  visual_mode         = 'v'
--  visual_block_mode   = 'x'
--  term_mode           = 't'
--  command_mode        = 'c'

-- Telescope
keymap("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>", opts)

-- FZF
keymap("n", "<C-p>", ":Files<cr>", opts)
