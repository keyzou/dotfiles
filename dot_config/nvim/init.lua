require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("commands")
require("pack")

vim.cmd.colorscheme("moonfly")
vim.g.moonflyCursorColor = true
vim.g.moonflyNormalPmenu = true
vim.o.pumborder = "single"
vim.g.moonflyVirtualTextColor = true

