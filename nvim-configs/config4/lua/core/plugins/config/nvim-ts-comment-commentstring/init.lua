local M = {
	"JoosepAlviste/nvim-ts-context-commentstring",
}

function M.config()
	require("ts_context_commentstring").setup({})
end

return M

