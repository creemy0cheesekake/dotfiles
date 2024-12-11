require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "lua", "javascript", "typescript", "cpp", "c", "html" },
	auto_install = true,
	highlight = { enable = true },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			html = "<!-- %s -->",
			c = "// %s",
			cpp = "// %s",
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			commentary_integration = {
				-- change default mapping
				Commentary = "g/",
				-- disable default mapping
				CommentaryLine = false,
			},
		},
	},
})
