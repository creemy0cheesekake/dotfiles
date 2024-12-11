local M = {
	"lukas-reineke/indent-blankline.nvim",
}

local filetypes = {
    "",
    "checkhealth",
    "help",
    "lspinfo",
    "packer",
    "TelescopePrompt",
    "TelescopeResults",
    "yaml",
}
filetypes = vim.list_extend(filetypes, {"alpha", "neo-tree"})

function M.config()
	require("ibl").setup({
		indent = {
			char = "│",
		},
		scope = {
			show_start = false,
			show_end = false,
			show_exact_scope = true,
		},
		exclude = {
			filetypes = filetypes,
			buftypes = { "terminal", "quickfix" },
		},
	})
end

return M
