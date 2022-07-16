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
keymap("n", "<C-p>", ":lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>l", ":lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>b", ":lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>s", ":lua require('telescope.builtin').grep_string()<cr>", opts)
keymap("n", "<leader>f", ":Telescope file_browser<cr>", opts)
