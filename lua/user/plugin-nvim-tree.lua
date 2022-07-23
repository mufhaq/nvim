require("nvim-tree").setup({
	sort_by = "extension",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		width = "25%",
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		add_trailing = true,
		group_empty = true,
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = "  ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				folder = {
					arrow_open = "﬌",
					arrow_closed = "",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			error = " ",
			warning = " ",
			hint = " ",
			info = " ",
		},
	},
	update_focused_file = {
		enable = true,
		update_root = false,
	},
})
