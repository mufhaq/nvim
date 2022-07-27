local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)

	-- Disable lspconfig formatter
	client.resolved_capabilities.document_formatting = false
end

require("nvim-lsp-installer").setup({
	ensure_installed = {
		"sumneko_lua",
		"gopls",
		"tsserver",
		"pyright",
		"rust_analyzer",
		"intelephense",
		"bashls",
		"clangd",
	},
	automatic_installation = false,

	ui = {
		check_outdated_servers_on_open = true,
		border = "none",
		icons = {
			server_installed = "◍",
			server_pending = "◍",
			server_uninstalled = "◍",
		},
		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
		},
	},
	pip = {
		install_args = {},
	},
	log_level = vim.log.levels.DEBUG,
	max_concurrent_installers = 4,
	github = {
		download_url_template = "https://github.com/%s/releases/download/%s/%s",
	},
})

local function ls_prefix(name)
	return string.format("user.language-server-settings.setting-%s", name)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local function extend(ls)
	local req = require(ls_prefix(ls))
	return vim.tbl_deep_extend("force", req, {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150, -- default
		},
		capabilities = capabilities,
	})
end

local server_list = require("nvim-lsp-installer").get_installed_servers()
local nvim_lsp = require("lspconfig")
for _, lsp in ipairs(server_list) do
	nvim_lsp[lsp.name].setup(extend(lsp.name))
end

-- Other Settings

-- Diagnostic Config
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

-- Icons for Native LSP
local icons = require("icons").kinds
local kinds = vim.lsp.protocol.CompletionItemKind
for i, kind in ipairs(kinds) do
	kinds[i] = icons[kind] or kind
end

-- Diagnostic Symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
