require("plugins")
require("options")
require("keymaps")

-- user
require("user.setting-lsp")
require("user.setting-cmp")
require("user.setting-treesitter")
require("user.setting-null-ls")
require("user.setting-lualine")
require("user.setting-gitsigns")
require("user.setting-telescope")
require("user.setting-fidget")
require("user.setting-indent-blankline")
require("user.setting-impatient")
require("user.setting-colorizer")
require("user.setting-sniprun")
require("user.setting-nvim-tree")
require("user.setting-bufferline")
require("user.setting-comment")
require("colorscheme").vscode()

-- keep this line at the very bottom
require("functions").init()
