local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
require("lazy").setup({
	-- Colorschemes
	"morhetz/gruvbox",
	"Mofiqul/vscode.nvim",
	-- LSP
	"neovim/nvim-lspconfig",
	{
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
	},
	"mfussenegger/nvim-jdtls",
	"simrat39/rust-tools.nvim",
	"folke/trouble.nvim",
	"ray-x/lsp_signature.nvim",
	-- CMP
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"L3MON4D3/LuaSnip",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",
	-- Latex
	"lervag/vimtex",
	-- Others
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	{ "nvim-lualine/lualine.nvim" },
	"lewis6991/gitsigns.nvim",
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"lewis6991/impatient.nvim",
	"norcalli/nvim-colorizer.lua",
	{ "michaelb/sniprun", run = "bash ./install.sh" },
	{ "kyazdani42/nvim-tree.lua", tag = "nightly" },
	{ "projekt0n/github-nvim-theme" },
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"CRAG666/code_runner.nvim",
	"b0o/schemastore.nvim",
})
