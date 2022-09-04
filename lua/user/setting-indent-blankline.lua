vim.g["indent_blankline_viewport_buffer"] = 1000
vim.opt.list = true
vim.opt.listchars:append({space = "⋅"})
--vim.opt.listchars:append({ eol = "↴" })

require("indent_blankline").setup({
    space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = false,
	show_first_indent_level = true,
	show_trailing_blankline_indent = false,
	show_end_of_line = true,
})
