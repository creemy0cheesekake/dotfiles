-- n, v, i, t = mode names

local map = vim.keymap.set
local e_opts = { expr = true }
local s_opts = { silent = true }
local se_opts = { silent = true, expr = true }

---------- insert mode ----------
-- go to  beginning and end
map("i", "<C-b>", "<ESC>^i")
map("i", "<C-e>", "<End>")

-- navigate within insert mode
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-h>", "<C-w>")

---------- normal mode  ----------
map("n", "<Esc>", ":noh <CR>")
-- switch between windows
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- switch tabs
map("n", "<Tab>", "gt")
map("n", "<A-Tab>", "gT")

-- save
map("n", "<C-s>", "<cmd> w <CR>")

-- Copy all
map("n", "<C-c>", "<cmd> %y+ <CR>")

-- line numbers
map("n", "<leader>n", "<cmd> set nu! <CR>")
map("n", "<leader>rn", "<cmd> set rnu! <CR>")

-- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
-- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
-- empty mode is same as using <cmd> :map
-- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', e_opts)
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', e_opts)
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', e_opts)
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', e_opts)

map("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end)
map("n", "-", "$")
map("n", "dl", "yyp")
map("n", "<C-q>", "<Cmd>!alacritty &<CR><CR>")
map("n", "0", "^")
map("n", "<leader>ww", ":se invwrap<CR>", s_opts)

-- idk
-- map("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))

---------- visual mode ----------
map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', e_opts)
map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', e_opts)
map("v", "-", "$")
map("v", ">", ">gv")
map("v", "<", "<gv")
map("v", "0", "^")

---------- x mode ----------
map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', e_opts)
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', e_opts)
-- Don't copy the replaced text after pasting in visual mode
-- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', s_opts)

---------- Plugin Maps ----------

-- Comment
map("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)")
map("v", "<C-/>", "<Plug>(comment_toggle_linewise_visual)")

-- nvimtree
-- toggle
map("n", "<C-n>", "<cmd> NvimTreeToggle %:p:h<CR>")
-- focus
map("n", "<leader>e", "<cmd> NvimTreeFocus<CR>")

-- whichkey
map("n", "<leader>wK", function()
	vim.cmd("WhichKey")
end)
map("n", "<leader>wk", function()
	local input = vim.fn.input("WhichKey: ")
	vim.cmd("WhichKey " .. input)
end)

-- gitsigns
-- Navigation through hunks
map("n", "]c", function()
	if vim.wo.diff then
		return "]c"
	end
	vim.schedule(function()
		require("gitsigns").next_hunk()
	end)
	return "<Ignore>"
end, e_opts)

map("n", "[c", function()
	if vim.wo.diff then
		return "[c"
	end
	vim.schedule(function()
		require("gitsigns").prev_hunk()
	end)
	return "<Ignore>"
end, e_opts)

-- Actions
map("n", "<leader>rh", function()
	require("gitsigns").reset_hunk()
end)
map("n", "<leader>ph", function()
	require("gitsigns").preview_hunk()
end)
map("n", "<leader>gb", function()
	package.loaded.gitsigns.blame_line()
end)
map("n", "<leader>td", function()
	require("gitsigns").toggle_deleted()
end)

-- dap
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
map("n", "<F9>", "<cmd> DapContinue <CR>")
map("n", "<leader>dt", "<cmd> DapTerminate <CR>")
map("n", "<F10>", "<cmd> DapStepInto <CR>")
map("n", "<F11>", "<cmd> DapStepOver <CR>")
map("n", "<F8>", "<cmd> DapStepOut <CR>")

-- jaq
map("n", "<leader>rr", "<cmd>Jaq<CR>")
