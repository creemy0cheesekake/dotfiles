local autocmd = vim.api.nvim_create_autocmd

local build_and_run_map = "<leader>rr"
local build_map = "<leader>rb"

-- set run commands
autocmd("FileType", {
  pattern = {"c"},
	callback = function()
		vim.keymap.set(
			"n",
			build_and_run_map,
			':execute "wa | !gcc %:p -o %:p:h/_%:t:r -lm && exec %:p:h/_%:t:r"<CR>',
			{ noremap = true }
		)
	end,
})

autocmd("FileType", {
  pattern = {"c"},
	callback = function()
		vim.keymap.set(
			"n",
			build_map,
			':execute "wa | !gcc %:p -o %:p:h/_%:t:r -lm"',
			{ noremap = true }
		)
	end,
})

autocmd("FileType", {
  pattern = {"cpp"},
	callback = function()
		vim.keymap.set(
			"n",
			build_and_run_map,
			':execute "wa | !g++ -g %:p -o %:p:h/_%:t:r -lm && exec %:p:h/_%:t:r"<CR>',
			{ noremap = true }
		)
	end,
})

autocmd("FileType", {
  pattern = {"cpp"},
	callback = function()
		vim.keymap.set(
			"n",
			build_map,
			':execute "wa | !g++ -g %:p -o %:p:h/_%:t:r -lm"',
			{ noremap = true }
		)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	callback = function()
		vim.keymap.set("n", build_and_run_map, ':execute "wa | !python %:p"<CR>', { noremap = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "javascript",
	callback = function()
		vim.keymap.set("n", build_and_run_map, ':execute "wa | !npm start"<CR>', { noremap = true })
	end,
})

autocmd("FileType", {
  pattern = {"tex"},
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
  pattern = {"tex"},
	callback = function()
		vim.keymap.set(
			"n",
			build_map,
			':execute "wa | !pdflatex %:p"<CR>',
			{ noremap = true }
		)
	end,
})


-- set filetypes
-- autocmd("BufNewFile,BufRead", {
autocmd({"BufNewFile","BufRead"}, {
  pattern = {"*xmobar*"},
  command = "setfiletype haskell",
})
