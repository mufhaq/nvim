require("code_runner").setup({
	mode = "term",
	focus = false,
	startinsert = false,
	term = {
		position = "belowright",
		size = 20,
	},
	filetype_path = vim.fn.expand("~/.config/nvim/code_runner.json"),
	project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
})