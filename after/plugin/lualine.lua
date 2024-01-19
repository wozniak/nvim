if vim.fn.has('gui_running') == 1 then
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
			theme = require('lualine.themes.auto'),
	  }
	}
end
