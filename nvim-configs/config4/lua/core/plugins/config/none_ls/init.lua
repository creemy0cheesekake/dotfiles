local M = {
	"nvimtools/none-ls.nvim",
	dependencies = "nvim-lua/plenary.nvim",
}

function M.config()
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local null_ls = require("null-ls")

	null_ls.setup({
		sources = {
			null_ls.builtins.formatting.clang_format,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.autopep8,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.shfmt,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({
					group = augroup,
					buffer = bufnr,
				})
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end

return M
