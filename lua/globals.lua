vim.g.USER = os.getenv("USER")

vim.g.vimtex_view_general_viewer = "okular"
vim.g.vimtex_view_general_options = "--unique file:@pdf#src:@line@tex"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk = {
	["aux_dir"] = "out/aux",
	["out_dir"] = "out/build",
}
