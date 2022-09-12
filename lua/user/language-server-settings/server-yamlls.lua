local util = require("lspconfig").util

return {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose" },
	root_dir = function(fname)
		return util.root_pattern(".git")(fname) or util.path.dirname(fname)
	end,
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
		yaml = {
			schemas = {
				[string.format("file:///home/%s/.config/nvim/schemas/compose-spec.json")] = "/*docker-compose.*",
			},
		},
	},
	single_file_support = true,
}
