return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true,
		},
	},
	single_file_support = true,
}
