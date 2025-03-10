local M = {
	"JoosepAlviste/nvim-ts-context-commentstring",
}

function M.config()
	require("ts_context_commentstring").setup({})
end

local original_get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	if option == "commentstring" then
		return require("ts_context_commentstring.internal").calculate_commentstring()
	else
		return original_get_option(filetype, option)
	end
end

return M
