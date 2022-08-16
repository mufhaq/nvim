local util = require("lspconfig").util

return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = { hostinfo = "neovim" },
	root_dir = function(fname)
		return util.root_pattern("tsconfig.json")(fname)
			or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
			or util.path.dirname(fname)
	end,
}
