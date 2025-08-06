local M = {
	"ThemerCorp/themer.lua",
}

function M.config()
	require("themer").setup({
		colorscheme = "catppuccin",
		styles = {
			["function"] = { style = "italic" },
			functionbuiltin = { style = "italic" },
			variable = { style = "italic" },
			variableBuiltIn = { style = "italic" },
			parameter = { style = "italic" },
		},
	})
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#95939e" })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#95939e" })
end

return M
