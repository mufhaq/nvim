local util = require("lspconfig").util
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_dir = util.root_pattern(".luarc.json", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", ".git"),
	single_file_support = true,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				--library = vim.api.nvim_get_runtime_file("$VIMRUNTIME", true),
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua/")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
