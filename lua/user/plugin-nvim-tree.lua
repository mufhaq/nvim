require("nvim-tree").setup({
	sort_by = "extension",
	view = {
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" },
			},
		},
		width = 30,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		full_name = false,
		highlight_opened_files = "none",
		indent_markers = { -- Subdir and Subfile are not aligned, waiting for next nvim-tree fix patch
			enable = true,
			icons = {
				corner = "╰─",
				edge = "│",
				item = "├─",
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
				folder_arrow = false,
				git = true,
			},
			glyphs = {
				folder = {
					arrow_open = "",
					arrow_closed = "",
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
