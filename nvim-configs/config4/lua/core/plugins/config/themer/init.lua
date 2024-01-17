local M = {
	"ThemerCorp/themer.lua",
}

function M.config()
	require("themer").setup({
		colorscheme = "catppuccin",
		styles = {
			["function"] = { style = 'italic' },
			functionbuiltin = { style = 'italic' },
			variable = { style = 'italic' },
			variableBuiltIn = { style = 'italic' },
			parameter  = { style = 'italic' },
		},
	})
end

return M
