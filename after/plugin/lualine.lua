if vim.fn.has('gui_running') then
	require('lualine').setup {
		options = { 
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			theme = require('lualine.themes.powerline'),
	  }
	}
else
	require('lualine').setup {
		options = { 
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
	  }
	}
end
