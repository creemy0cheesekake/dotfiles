-- local dap = require("dap")
-- dap.adapters.lldb = {
-- 	id = "lldb",
-- 	type = "executable",
-- 	command = "/sbin/lldb",
-- }
-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch file",
-- 		type = "lldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopAtEntry = true,
-- 	},
-- }
-- setupCommands = {
-- 	{
-- 		text = "-enable-pretty-printing",
-- 		description = "enable pretty printing",
-- 		ignoreFailures = false,
-- 	},
-- }
