local M = {}

M.general = {
	plugin = false,
	n = {
		["-"] = {
			"$",
			"Same as $",
		},
		["dl"] = {
			"yyp",
			"Same as yyp",
		},
		["<C-q>"] = {
			"<Cmd>!alacritty &<CR><CR>",
			"Open terminal in current directory"
		},
		["0"] = {
			"^",
			"Same as ^"
		},
		["<leader>ww"] = {
			":se invwrap<CR>",
			"toggles wrap",
			opts = {silent = true}
		},
	},
	v = {
		["-"] = {
			"$",
			"Same as $",
		},
		[">"] = {
			">gv",
			"Stay in visual mode after indenting"
		},
		["<"] = {
			"<gv",
			"Stay in visual mode after indenting"
		},
		["0"] = {
			"^",
			"Same as ^"
		},
	},
	i = {
		["<C-h>"] = {
			"<C-w>",
			"remap <C-BS> to delete word"
		},
	},
}

M.dap = {
	plugin = true,
	n = {
		["<leader>db"] = {
			"<cmd> DapToggleBreakpoint <CR>",
			"Add breakpoint at line",
		},
		["<F9>"] = {
			"<cmd> DapContinue <CR>",
			"Start or continue the debugger",
		},
		["<leader>dt"] = {
			"<cmd> DapTerminate <CR>",
			"Terminate the debugger",
		},
		["<F10>"] = {
			"<cmd> DapStepInto <CR>",
			"Go to the next line",
		},
		["<F11>"] = {
			"<cmd> DapStepOver <CR>",
			"Go to the next line but skip over the implementation",
		},
		["<F8>"] = {
			"<cmd> DapStepOut <CR>",
			"Lets the program run until the current implementation returns",
		},
	},
}

return M
