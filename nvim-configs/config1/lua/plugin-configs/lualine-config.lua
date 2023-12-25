local custom_gruvbox = require'lualine.themes.gruvbox-material'


custom_gruvbox.normal.c = {
	bg = "#4d453c",
	fg = "#ddc7a1"
}
custom_gruvbox.normal.a.bg  = '#d8a657'
custom_gruvbox.insert.a.bg  = '#8ec07c'
custom_gruvbox.visual.a.bg  = '#ea6962'
custom_gruvbox.replace.a.bg = '#cc241d'
custom_gruvbox.command.a.bg = '#dec78c'
-- print(vim.inspect(custom_gruvbox.normal.c))
-- print(vim.inspect(custom_gruvbox.insert.c))
-- print(vim.inspect(custom_gruvbox.visual.c))

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_gruvbox,
		-- component_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		component_separators = { left = '|', right = '|'},
		section_separators = { left = '', right = ''},
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {'branch', 'diff', 'diagnostics'},
		lualine_c = {'filename'},
		lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {'filename'},
		lualine_x = {'location'},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
