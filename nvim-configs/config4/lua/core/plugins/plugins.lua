return {
	-- ------------------------------- Themes ------------------------------- --
	require("core.plugins.config.themer"),
	-- -------------------------------- Looks ------------------------------- --
	require("core.plugins.config.treesitter"),
	-- require("core.plugins.config.devicons"),
	require("core.plugins.config.indentline"),
	require("core.plugins.config.dressing"),
	require("core.plugins.config.linefly"),
	require("core.plugins.config.nvim-colorizer"),
	require("core.plugins.config.true-zen"),
	require("core.plugins.config.vimade"),
	-- --------------------------------- LSP -------------------------------- --
	require("core.plugins.config.nvim-cmp"),
	require("core.plugins.config.lspconfig"),
	require("core.plugins.config.none_ls"),
	require("core.plugins.config.mason"),
	require("core.plugins.config.lsp_signature"),
	-- -------------------------------- Functionality ------------------------------- --
	require("core.plugins.config.telescope"),
	require("core.plugins.config.nvim-tree"),
	require("core.plugins.config.gitsigns"),
	require("core.plugins.config.autopairs"),
	require("core.plugins.config.whichkey"),
	require("core.plugins.config.jaq"),
	require("core.plugins.config.nvim-comment"),
	require("core.plugins.config.nvim-ts-comment-commentstring"),
	require("core.plugins.config.nvim-surround"),
	require("core.plugins.config.commentless"),
	-- -------------------------------- Debug ------------------------------- --
	require("core.plugins.config.mason-nvim-dap"),
	require("core.plugins.config.nvim-dap"),
	require("core.plugins.config.nvim-dap-ui"),
	require("core.plugins.config.nvim-dap-virtual-text"),
	require("core.plugins.config.persistent-breakpoints"),
}
