require("nvim-tree").setup({
	sort_by = "name",
	view = {
		centralize_selection = false,
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		width = 40,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	tab = {
		sync = {
			open = true,
			close = true,
		},
	},
	renderer = {
		add_trailing = false,
		group_empty = true,
		full_name = false,
		highlight_opened_files = "none",
		root_folder_modifier = ":t",
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				none = " ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "before",
			padding = " ",
			symlink_arrow = " ➛ ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	diagnostics = {
		enable = true,
		icons = {
			error = "󰅚 ",
			warning = " ",
			hint = "󰌶 ",
			info = " ",
		},
	},
	update_focused_file = {
		enable = true,
		update_root = false,
	},
})
