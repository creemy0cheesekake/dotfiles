vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- visual
	use("gruvbox-community/gruvbox")
	use("luisiacc/gruvbox-baby")
	use("p00f/nvim-ts-rainbow")
	use("psliwka/vim-smoothie")
	use("anuvyklack/pretty-fold.nvim")
	use("nvim-lualine/lualine.nvim")
	use("kosayoda/nvim-lightbulb")
	use("norcalli/nvim-colorizer.lua")

	-- lsp and debuggers
	use("dense-analysis/ale")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("mfussenegger/nvim-dap")
	use("jay-babu/mason-nvim-dap.nvim")
	use("rcarriga/nvim-dap-ui")

	-- code completion
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp-signature-help")
	use("dcampos/cmp-snippy")

	-- file management
	use({ "nvim-tree/nvim-tree.lua", requires = { "nvim-tree/nvim-web-devicons" }, tag = "nightly" })

	-- productivity
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("junegunn/goyo.vim")
	use("dahu/vim-fanfingtastic")
	use("Yggdroot/indentLine")
	use("steelsojka/pears.nvim")
	use("nvim-lua/plenary.nvim")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-context")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("abecodes/tabout.nvim")
	use("wesQ3/vim-windowswap")
	use("lewis6991/gitsigns.nvim")

	-- programming tools
	use("numToStr/Comment.nvim")
	use("dcampos/nvim-snippy")

	-- language-specific
	use("ap/vim-css-color")
	use("dag/vim-fish")
	use("jsit/sasscomplete.vim")
	use("tpope/vim-haml")
	use("jose-elias-alvarez/typescript.nvim")
end)
