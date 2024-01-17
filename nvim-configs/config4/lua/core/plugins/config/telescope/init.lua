local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { 
		'nvim-lua/plenary.nvim',
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
		"nvim-tree/nvim-web-devicons",
	}
}

function M.config()
	local actions = require("telescope.actions")
	local telescope = require("telescope")
	telescope.setup({
		defaults = {
			mappings = {
				i = {
					["<C-k>"] = actions.move_selection_previous,
					["<C-j>"] = actions.move_selection_next,

					["<C-n>"] = actions.cycle_history_next,
					["<C-p>"] = actions.cycle_history_prev,
				}
			}
		}
	})
	telescope.load_extension("fzf")
	local keymap = vim.keymap
	keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
	keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>")
	keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
	keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
end

return M

