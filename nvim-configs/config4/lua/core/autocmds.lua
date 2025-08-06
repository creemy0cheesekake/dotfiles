local autocmd = vim.api.nvim_create_autocmd

local build_and_run_map = "<leader>rr"
local build_map = "<leader>rb"

-- set run commands
autocmd("FileType", {
	pattern = { "c" },
	callback = function()
		vim.keymap.set("n", build_and_run_map, ':execute "wa | !make"<CR>', { noremap = true })
	end,
})

autocmd("FileType", {
	pattern = { "c" },
	callback = function()
		vim.keymap.set("n", build_map, ':execute "wa | !gcc %:p -o %:p:h/_%:t:r -lm"', { noremap = true })
	end,
})

autocmd("FileType", {
	pattern = { "cpp" },
	callback = function()
		vim.keymap.set("n", build_and_run_map, ':execute "wa | !make"<CR>', { noremap = true })
	end,
})

autocmd("FileType", {
	pattern = { "cpp" },
	callback = function()
		vim.keymap.set("n", build_map, ':execute "wa | !g++ -g %:p -o %:p:h/_%:t:r -lm"', { noremap = true })
	end,
})

autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		vim.keymap.set(
			"n",
			build_and_run_map,
			':execute "wa | !pdflatex %:p && zathura %:p:r.pdf &"<CR>',
			{ noremap = true }
		)
	end,
})

autocmd("FileType", {
	pattern = { "tex" },
	callback = function()
		vim.keymap.set("n", build_map, ':execute "wa | !pdflatex %:p"<CR>', { noremap = true })
	end,
})

-- set filetypes
-- autocmd("BufNewFile,BufRead", {
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*xmobar*" },
	command = "setfiletype haskell",
})

-- general

autocmd("BufEnter", {
	pattern = { "*" },
	callback = function()
		vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "white" })
	end,
})
