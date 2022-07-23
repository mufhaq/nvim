vim.cmd([[ colo vscode ]])
--vim.cmd([[ hi Normal guibg=none guifg=white ctermbg=none ctermfg=white ]])
vim.cmd([[ 
    syntax on
    filetype indent on
]])
vim.cmd([[ 
    let NERDTreeShowHidden=1
    let $FZF_DEFAULT_COMMAND="find . ! -path '*.git*' ! -path '*node_modules*'"
]])

vim.o.background = "dark"

local vscode_colors = require("vscode.colors")
require("vscode").setup({
	transparent = true,
	italic_comments = true,
	disable_nvimtree_bg = true,
	color_overrides = {
		--vscLineNumber = '#FFFFFF',
	},
	group_overrides = {
		Cursor = { fg = vscode_colors.vscDarkBlue, bg = vscode_colors.vscLightGreen, bold = true },
	},
})

vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.nu = true
vim.opt.mouse = "a"
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.so = 5
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.wrap = true
vim.opt.linebreak = true

-- global
