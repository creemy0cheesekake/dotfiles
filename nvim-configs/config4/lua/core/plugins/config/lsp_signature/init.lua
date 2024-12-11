local M = {
	"ray-x/lsp_signature.nvim",
	dependencies = "nvim-lspconfig",
}


function M.config()
	require("core.plugins.config.others").lsp_signature()
end

return M
