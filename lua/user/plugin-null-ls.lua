local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.gofmt,
		--formatting.prettier.with({
		--	extra_args = { "--tab-width=4" },
		--}),
		formatting.prettierd,
		formatting.stylua,
		formatting.black.with({
			extra_args = { "--fast" },
		}),
		formatting.phpcsfixer.with({
			extra_args = { "--using-cache=no" },
		}),
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
})
