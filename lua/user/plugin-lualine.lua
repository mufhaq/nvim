local colors = {
	bg = "#303030",
	bg2 = "#404040",
	fg = "#262626",
	white = "#ffffff",
	black = "#000000",
	dark = "#1f1f1f",
	red = "#f44747",
	green = "#4EC9B0",
	blue = "#0a7aca",
	lightblue = "#5CB6F8",
	yellow = "#ffaf00",
	pink = "#DDB6F2",
}

local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

-- Config
local config = {
	options = {
		component_separators = "",
		section_separators = "",
		always_divide_middle = true,
		globalstatus = false,
		theme = {
			normal = {
				a = { bg = colors.dark },
				b = { bg = colors.dark },
				c = { bg = colors.dark },
				x = { bg = colors.dark },
				y = { bg = colors.dark },
				z = { bg = colors.dark },
			},
		},
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_y = {},
		lualine_z = {},
		lualine_c = {},
		lualine_x = {},
	},
}

local function ins_left(component)
	table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
	table.insert(config.sections.lualine_x, component)
end

local function color_by_mode()
	local mode_color_bg = {
		n = colors.blue,
		v = colors.yellow,
		V = colors.yellow,
		i = colors.green,
		r = colors.red,
		c = colors.pink,
	}
	local mode_color_fg = {
		n = colors.white,
		v = colors.bg,
		V = colors.bg,
		i = colors.bg,
		r = colors.bg,
		c = colors.bg,
	}
	return { fg = mode_color_fg[vim.fn.mode()], bg = mode_color_bg[vim.fn.mode()], gui = "bold" }
end

ins_left({
	"mode",
	color = color_by_mode,
	separator = { left = "", right = " " },
})

ins_left({
	"branch",
})

ins_left({
	"filetype",
	colored = true,
	icon_only = true,
	cond = conditions.buffer_not_empty,
	padding = { left = 1 },
})

ins_left({
	"filename",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"filesize",
	cond = conditions.buffer_not_empty,
})

ins_left({
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn", "info", "hint" }, -- error, warn, info, hint
	symbols = { error = " ", warn = " ", info = " " },
	diagnostics_color = {
		color_error = { fg = colors.red },
		color_warn = { fg = colors.yellow },
		color_info = { fg = colors.cyan },
	},
	update_in_insert = true,
	always_visible = false,
})

ins_right({
	"o:encoding",
	cond = conditions.hide_in_width,
})

ins_right({
	function()
		local msg = "No Active Lsp"
		local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
		local clients = vim.lsp.get_active_clients()
		if next(clients) == nil then
			return msg
		end
		for _, client in ipairs(clients) do
			local filetypes = client.config.filetypes
			if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
				return client.name
			end
		end
		return msg
	end,
	icon = " LSP:",
	color = { fg = colors.cyan },
})

ins_right({
	"progress",
})

ins_right({
	"location",
	color = color_by_mode,
	separator = { left = " ", right = "" },
})

require("lualine").setup(config)
