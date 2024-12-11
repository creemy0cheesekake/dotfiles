local lspconfig = require("lspconfig")

local function setups(on_attach, capabilities)
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,

		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						[vim.fn.stdpath("data") .. "/lazy/extensions/nvchad_types"] = true,
						[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
					},
					maxPreload = 100000,
					preloadFileSize = 10000,
				},
			},
		},
	})
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})
	lspconfig.eslint.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	lspconfig.julials.setup({
		on_new_config = function(new_config, _)
			local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
			if require("lspconfig").util.path.is_file(julia) then
				vim.notify("Hello!")
				new_config.cmd[1] = julia
			end
		end,
	})
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
	lspconfig.astro.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})
end

return { setups = setups }
