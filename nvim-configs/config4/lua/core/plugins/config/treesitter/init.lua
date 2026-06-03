local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	dependencies = {
		"HiPhish/rainbow-delimiters.nvim",
		"windwp/nvim-ts-autotag",
	},
}

function M.config()
	-- Check if we are on the new branch or the old one
	local ok, configs = pcall(require, "nvim-treesitter.configs")

	if ok then
		-- This covers the transition period
		configs.setup({
			ensure_installed = { "lua", "vim", "vimdoc", "query", "nu", "javascript", "typescript", "c", "cpp" },
			auto_install = true,
			highlight = {
				enable = true,
			},
		})
	else
		-- If the configs module is totally gone in your local version:
		-- Use the installer directly
		-- local install = require("nvim-treesitter.install")
		-- install.ensure_installed({ "lua", "vim", "vimdoc", "query", "nu", "javascript", "typescript", "c", "cpp" })

		-- Highlighting is now handled by Neovim core via:
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})
	end

	-- Setup autotag (independent of TS core now)
	local autotag_ok, autotag = pcall(require, "nvim-ts-autotag")
	-- autotag.setup({})
	if autotag_ok then
		autotag.setup({})
	end
end

return M
