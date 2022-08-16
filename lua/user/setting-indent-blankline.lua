vim.opt.list = true
--vim.opt.listchars:append("eol:↴") -- Make visual mode selection col0 color trasparent
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup({
	show_current_context = false,
	show_current_context_start = false,
	show_first_indent_level = true,
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
})
