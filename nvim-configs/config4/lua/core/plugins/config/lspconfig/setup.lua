local function setups(on_attach, capabilities)
	-- Helper to merge capabilities and on_attach into the new config format
	local function make_config(user_config)
		return vim.tbl_deep_extend("force", {
			capabilities = capabilities,
			-- In 0.12+, we use LspAttach autocmds instead of on_attach,
			-- but if your setup still requires it, we pass it here:
			on_attach = on_attach,
		}, user_config or {})
	end

	-- 1. Lua (lua_ls)
	vim.lsp.config(
		"lua_ls",
		make_config({
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})
	)

	-- 2. C++ (clangd)
	vim.lsp.config(
		"clangd",
		make_config({
			cmd = { "clangd", "--offset-encoding=utf-16" },
		})
	)

	-- 3. Julia (julials)
	local julia_bin = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
	vim.lsp.config(
		"julials",
		make_config({
			cmd = {
				vim.uv.fs_stat(julia_bin) and julia_bin or "julia",
				"--startup-file=no",
				"--history-file=no",
				"-e",
				"using LanguageServer; runserver()",
			},
		})
	)

	-- 4. The "Standard" Servers
	local standard_servers = {
		"eslint",
		"jsonls",
		"pyright",
		"bashls",
		"emmet_ls",
		"astro",
	}

	for _, server in ipairs(standard_servers) do
		vim.lsp.config(server, make_config({}))
	end

	-- CRITICAL: In 0.12, defining a config doesn't start it.
	-- You must enable them.
	local all_servers = { "lua_ls", "clangd", "julials", "eslint", "jsonls", "pyright", "bashls", "emmet_ls", "astro" }
	for _, server in ipairs(all_servers) do
		vim.lsp.enable(server)
	end
end

return { setups = setups }
