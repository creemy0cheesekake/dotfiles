require("mason").setup()
require("mason-lspconfig").setup({
	-- ensure_installed = { 'autopep8', 'clang-format', 'clangd', 'cpptools', 'css-lsp', 'debugpy', 'emmet-ls', 'eslint-lsp', 'html-lsp', 'js-debug-adapter', 'json-lsp', 'julia-lsp', 'prettierd', 'pyright' },
})

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
	handlers = {},
})
