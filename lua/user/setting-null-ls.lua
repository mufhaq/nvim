local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local excluded_files = {
	"c",
	"cpp",
}

null_ls.setup({
	sources = {
		formatting.gofmt,
		formatting.prettier.with({
			extra_args = function()
				local args = {}
				if vim.bo.filetype == "json" or vim.bo.filetype == "jsonc" or vim.bo.filetype == "yaml" then
					table.insert(args, 1, "--tab-width=2")
				else
					table.insert(args, 1, "--tab-width=4")
				end
				table.insert(args, 2, "--print-width=80")
				return args
			end,
			extra_filetypes = { "php" }, -- with prettier/plugin-php npm
		}),
		formatting.stylua,
		formatting.black.with({
			extra_args = { "--fast", "--line-length=80" },
		}),
		formatting.rustfmt,
		formatting.clang_format.with({
			extra_args = { "-style={IndentWidth: 4}" },
		}),
	},
	on_attach = function(client, bufnr)
		-- Format On Save
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					local file = nil
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					if #excluded_files > 0 then
						for _, k in pairs(excluded_files) do
							if vim.bo.filetype ~= k then
								-- vim.lsp.buf.formatting_sync()
								file = vim.bo.filetype
							end
						end
					else
						goto format
					end

					if file ~= nil then
						if file == vim.bo.filetype then
							goto format
						else
							goto skip
						end
					else
						goto skip
					end

					::format::
					vim.lsp.buf.formatting_sync()
					::skip::
				end,
			})
		end
	end,
})
