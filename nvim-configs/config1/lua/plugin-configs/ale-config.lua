vim.g.ale_fixers = {
	python = { "autopep8", "black" },
	html = { "prettier", "eslint" },
	javascript = { "prettier", "eslint" },
	typescript = { "prettier", "eslint" },
	javascriptreact = { "prettier", "eslint" },
	typescriptreact = { "prettier", "eslint" },
	json = { "prettier", "eslint" },
	jsonc = { "prettier", "eslint" },
	svelte = { "prettier", "eslint" },
	c = { "clang-format" },
	cpp = { "clang-format" },
	java = { "google_java_format" },
	sass = { "stylelint" },
	lua = { "stylua" },
}
vim.g.ale_disable_lsp = true
