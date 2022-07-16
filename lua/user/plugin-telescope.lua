local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = telescope.extensions.file_browser.actions

telescope.setup({
	defaults = {
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
			width = 0.45,
			layout_strategy = "horizontal",
			layout_config = {
				preview_width = 0.55,
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
			width = 0.45,
			layout_strategy = "horizontal",
			layout_config = {
				preview_width = 0.55,
			},
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
