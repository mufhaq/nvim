local util = require("lspconfig").util
return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_dir = util.root_pattern(
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git"
	),
	single_file_support = true,
}
