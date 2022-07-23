local functions = require("functions").user
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
keymap("n", "<C-p>", require("telescope.builtin").find_files, opts)
keymap("n", "<leader>l", require("telescope.builtin").live_grep, opts)
keymap("n", "<leader>b", require("telescope.builtin").buffers, opts)
keymap("n", "<leader>s", require("telescope.builtin").grep_string, opts)
keymap("n", "<leader>f", require("telescope").extensions.file_browser.file_browser, opts)

-- Sniprun
keymap("n", "<F5>", functions.sniprun, opts)
keymap("n", "<F6>", ":SnipClose<cr>", opts)
