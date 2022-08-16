local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			".git/",
			"target/",
			"docs/",
			"vendor/",
			"__pycache__/",
			"node_modules/",
		},
		mappings = {
			i = {
				["<esc>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-o>"] = actions.select_default,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
			hidden = true,
		},
		live_grep = {
			theme = "ivy",
			hidden = true,
		},
		buffers = {
			theme = "ivy",
			hidden = true,
		},
		grep_string = {
			theme = "ivy",
			hidden = true,
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = false,
			theme = "ivy",
			path = "%:p:h",
			mappings = {
				["i"] = {
					["<C-n>"] = fb_actions.create,
					["<C-m>"] = fb_actions.move,
					["<C-r>"] = fb_actions.rename,
					["<C-c>"] = fb_actions.copy,
					["<C-d>"] = fb_actions.remove,
				},
			},
		},
	},
})

require("telescope").load_extension("file_browser")
