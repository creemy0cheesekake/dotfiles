vim.api.nvim_create_autocmd({ "FocusLost" }, {
	callback = function()
		vim.api.nvim_exec(":wa | :ALEFix", false)
	end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	callback = function()
		vim.api.nvim_exec(
			[[
        if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ |   exe "normal! g`\""
        \ |   " exe "normal! g`\"zz"
        \ | endif
    ]],
			false
		)
	end,
})
-- redundant, use nvim ts context commentstring
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "c", "cpp" },
	callback = function()
		vim.opt_local.commentstring = "// %s"
	end,
})

------------------
-- run commands --
------------------

local run_map = "<Leader>r"

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "c",
	callback = function()
		vim.keymap.set(
			"n",
			run_map,
			':execute "wa | !gcc %:p -o %:p:h/_%:t:r -lm && exec %:p:h/_%:t:r"<CR>',
			{ noremap = true }
		)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "cpp",
	--
	-- callback = function() vim.keymap.set("n", run_map, ':execute "wa | !g++ % -Wall -g -o %:p:h/d_%:t:r -lm"<CR>', {noremap = true}) end
	callback = function()
		vim.keymap.set(
			"n",
			run_map,
			':execute "wa | !g++ -g %:p -o %:p:h/_%:t:r -lm && exec %:p:h/_%:t:r"<CR>',
			{ noremap = true }
		)
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "python",
	callback = function()
		vim.keymap.set("n", run_map, ':execute "wa | !python %:p"<CR>', { noremap = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "javascript",
	callback = function()
		vim.keymap.set("n", run_map, ':execute "wa | !npm start"<CR>', { noremap = true })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = "nasm",
	callback = function()
		vim.keymap.set("n", run_map, ':execute "wa | !make && exec %:p:h/_%:t:r"<CR>', { noremap = true })
	end,
})

------------------
-- set filetype --
------------------

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "xmobarrc",
	callback = function()
		vim.opt_local.filetype = "haskell"
	end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.asm",
	callback = function()
		vim.opt_local.filetype = "nasm"
	end,
})
