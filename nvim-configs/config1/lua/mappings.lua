vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Tab>", "gt", { noremap = true })
vim.keymap.set("n", "<A-Tab>", "gT", { noremap = true })

-- "dl" for "duplicate line"
vim.keymap.set("n", "dl", "yyp", { noremap = true })

-- toggle line wrapping
vim.keymap.set("n", "<leader>w", "<Esc>:se invwrap<CR>", { noremap = true, silent = true })

-- copy file
vim.keymap.set("n", "<F2>", "ggyG", { noremap = true })

-- change to next capital letter
vim.keymap.set("n", "<A-c>", "c/\\u<CR><Esc>:noh<CR>a", { noremap = true, silent = true })

-- CTRL-S to save
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })

-- make j and k behave as expected in wrapping line text
vim.keymap.set({ "n", "v" }, "j", "gj", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "k", "gk", { noremap = true, silent = true })

-- different keys for start and end of line
vim.keymap.set({ "n", "v" }, "0", "g^", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "-", "g$", { noremap = true, silent = true })

-- Remap CTRL-Backspace to delete word in insert mode. (press C-v then C-BS to get ^H, which is the terminal code for C-BS)
vim.keymap.set("i", "", "<C-w>", { noremap = true, silent = true })

-- make <Space> play whatever macro is in the q register
vim.keymap.set("n", "<Space>", "@q", { noremap = true, silent = true })

-- persist visual mode selection after > and <
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })

-- move visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- launch terminal
vim.keymap.set({ "n", "v", "i" }, "<C-q>", "<Cmd>!alacritty &<CR><CR>", { noremap = true, silent = true })

-- move between splits
vim.keymap.set("n", "<A-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { noremap = true, silent = true })

-- move forward in jump list
vim.keymap.set("n", "<C-i>", "<C-i><Tab>", { noremap = true, silent = true })

-- lsp options
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, bufopts)
vim.keymap.set("n", "<Leader>A", vim.lsp.buf.code_action, bufopts)
vim.keymap.set("n", "<Leader>R", vim.lsp.buf.rename, bufopts)
vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, bufopts)
vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, bufopts)
vim.keymap.set("n", "gE", vim.diagnostic.goto_prev, bufopts)
------------------------------
-- plugin specific mappings --
------------------------------

-- format file with specified formatter
vim.keymap.set("n", "<Leader>f", "<Esc>:ALEFix<CR>", { noremap = true, silent = true })

-- C-/ to comment
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { noremap = true, silent = true })
vim.keymap.set("v", "<C-_>", "<Plug>(comment_toggle_linewise_visual)gv", { noremap = true, silent = true })

-- open nvimtree
vim.keymap.set("n", "<A-e>", "<Esc>:NvimTreeToggle %:p:h<CR>", { noremap = true, silent = true })

-- nvim-dap
vim.keymap.set("n", "<F11>", require("dap").continue, { noremap = true, silent = true })
vim.keymap.set("n", "<F10>", require("dap").step_into, { noremap = true, silent = true })
vim.keymap.set("n", "<F9>", require("dap").toggle_breakpoint, { noremap = true, silent = true })
vim.keymap.set("n", "<F5>", require("dap").close, { noremap = true, silent = true })
vim.keymap.set("n", "<Leader><F5>", require("dap").repl.open, { noremap = true, silent = true })
