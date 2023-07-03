local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

local lspc = require("lspconfig")

lspc.pyright.setup({})
lspc.clangd.setup({})
lspc.cssls.setup({ capabilities = capabilities })
lspc.emmet_ls.setup({ filetypes = { "html", "typescriptreact", "javascriptreact" } })
lspc.eslint.setup({ root_dir = lspc.util.root_pattern("package.json", "tsconfig.json") })
lspc.html.setup({ capabilities = capabilities })
lspc.jsonls.setup({ capabilities = capabilities })
lspc.julials.setup({})
