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
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
			},
		},
	},
}
