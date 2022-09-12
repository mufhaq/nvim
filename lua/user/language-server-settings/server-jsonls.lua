local util = require("lspconfig").util

return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	init_optsions = { provideFormatter = true },
	root_dir = function(fname)
		return util.root_pattern(".git")(fname) or util.path.dirname(fname)
	end,
	single_file_support = true,
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = string.format("file:///home/%s/.config/nvim/schemas/package.json", vim.g.USER),
				},
				{
					fileMatch = { "tsconfig.json" },
					url = string.format("file:///home/%s/.config/nvim/schemas/tsconfig.json", vim.g.USER),
				},
				{
					fileMatch = { "composer.json" },
					url = string.format("file:///home/%s/.config/nvim/schemas/composer.json", vim.g.USER),
				},
			},
		},
	},
}
