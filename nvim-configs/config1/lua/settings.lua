-- colorscheme
vim.g.gruvbox_baby_background_color = "dark"
vim.cmd("colorscheme gruvbox-baby")

-- settings
vim.g.mapleader = ","
vim.g.sass_recommended_style = false

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 0
vim.opt.expandtab = false

vim.opt.ignorecase = true
vim.opt.wildignorecase = true

-- hides text under status bar showing what mode its in
vim.opt.smd = false

-- make background transparent
-- vim.cmd([[:hi normal guibg=0]])

-- disables folding by default
vim.opt.foldenable = false
-- folding settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undodir')

-- sets default clipboard to system clipboard
vim.opt.clipboard = 'unnamedplus'

-- enables 24 bit rgb color in the tui.
vim.opt.termguicolors = true

-- set split colors
-- local color = '#4d453c'
vim.cmd([[:hi StatusLineNC guibg=#4d453c]])
vim.cmd([[:hi VertSplit guibg=#4d453c]])

-- stops linebreak at random point and makes it at certain chars
vim.opt.linebreak = true

-- highlights the line that the cursor is on
vim.opt.cursorline = true

vim.cmd.cnoreabbrev({ "Q!", "q!", })
vim.cmd.cnoreabbrev({ "W!", "w!", })
vim.cmd.cnoreabbrev({ "Wqa!", "wqa!", })
vim.cmd.cnoreabbrev({ "Wqa", "wqa!", })

vim.api.nvim_create_user_command("Pinstall", "wa | so % | PackerSync",{})
vim.api.nvim_create_user_command("S", "SudaWrite",{})
vim.api.nvim_create_user_command("Sq", "SudaWrite | q! | so %", {})

