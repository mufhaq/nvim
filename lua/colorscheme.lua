_G.M = {}

local hl = vim.api.nvim_set_hl

function M.codedark()
	vim.cmd([[ colo codedark ]])
end

function M.github()
	require("github-theme").setup({
		comment_style = "italic",
		hide_end_of_buffer = true,
		sidebars = {},
		theme_style = "dimmed",
		dark_sidebar = true,
		transparent = true,
	})
end

function M.vscode()
	vim.cmd([[ colo vscode ]])
	hl(0, "BufferLineFill", { bg = "#1e1e1e" })
	hl(0, "BufferLineIndicatorSelected", { fg = "#0a7aca" })
	hl(0, "BufferLineTabSelected", {})
	hl(0, "BufferLineCloseButton", { bg = "#1e1e1e" })
	hl(0, "BufferLineCloseButtonSelected", { bg = "#1e1e1e", bold = false })
	hl(0, "BufferLineBackground", { bg = "#1e1e1e" })
	hl(0, "BufferLineBufferSelected", { bold = false })
end

function M.onedark()
	require("onedark").setup({
		-- Main options --
		style = "warmer", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		transparent = false, -- Show/hide background
		term_colors = true, -- Change terminal color as per the selected theme style
		ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
		cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
		toggle_style_key = "<leader>ts", -- Default keybinding to toggle
		toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
		code_style = {
			comments = "italic",
			keywords = "none",
			functions = "none",
			strings = "none",
			variables = "none",
		},

		-- Custom Highlights --
		colors = {}, -- Override default colors
		highlights = {}, -- Override highlight groups

		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = true, -- use background color for virtual text
		},
	})
	require("onedark").load()
end

return M
