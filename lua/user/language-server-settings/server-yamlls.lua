local util = require("lspconfig").util

return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose" },
	root_dir = function(fname)
		return util.root_pattern(".git")(fname) or util.path.dirname(fname)
	end,
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "/*docker-compose.*",
			},
		},
	},
	single_file_support = true,
}
