local M = {
	"soemre/commentless.nvim",
	cmd = "Commentless",
	keys = {
		{
			"<leader>/",
			function()
				require("commentless").toggle()
			end,
			desc = "Toggle Comments",
		},
	},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		hide_following_blank_lines = true,
		foldtext = function(folded_count)
			return "(" .. folded_count .. " lines of comments)"
		end,
	},
}

function M.config()
	vim.api.nvim_set_hl(0, "Folded", { fg = "#444444" })
end

return M
