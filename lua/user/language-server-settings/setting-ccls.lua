local util = require("lspconfig").util
return {
	cmd = { "ccls" },
	filetypes = { "c", "cpp", "objc", "objcpp" },
	offset_encoding = "utf-32",
	root_dir = util.root_pattern("compile_commands.json", ".ccls", ".git"),
	single_file_support = false, -- idk why, but this not work
	init_options = {
		compilationDatabaseDirectory = "build",
		cache = { directory = vim.fn.stdpath("cache") .. "/ccls" },
	},
}
