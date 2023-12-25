require "custom.autocmds"

vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<Leader>A", vim.lsp.buf.code_action)
vim.keymap.set("n", "<Leader>R", vim.lsp.buf.rename)
vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "ge", vim.diagnostic.goto_next)
vim.keymap.set("n", "gE", vim.diagnostic.goto_prev)
