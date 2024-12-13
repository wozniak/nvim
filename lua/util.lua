local M = {}

M.nn = function(lh, rh)
	vim.keymap.set('n', lh, rh, { noremap = true, silent = true })
end

return M
