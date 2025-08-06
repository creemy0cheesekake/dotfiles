local M = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- "HiPhish/rainbow-delimiters.nvim",
		"windwp/nvim-ts-autotag",
		"nushell/tree-sitter-nu",
	},
}

function M.config()
	require("nvim-treesitter.configs").setup({
		sync_install = true,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		autotag = {
			enable = true,
		},
	})
end

return M
