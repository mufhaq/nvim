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
	hl(0, "BufferLineBufferSelected", { bold = true })
end

return M
