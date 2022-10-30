colorscheme ghdark

set number
set noshowmode

set spr sb
set pb=12 winbl=12
set ff=unix ffs=unix,dos

set guifont=Consolas:h12

set ts=4 sw=4 noet tw=80 cc=80
set fcs=eob:\  list lcs=tab:\│\ ,trail:⎵

" on windows this causes hanging, unbind it
nmap <C-z> <Nop>

" make the colorcolumn not an outrageous red color
highlight ColorColumn guibg=#161b22

let g:neovide_refresh_rate = 240

let g:mapleader = " "
set mouse=a

function s:InitLSP()
lua <<EOF
	require('lualine').setup()

	local cmp = require "cmp"
	local cmp_lsp = require "cmp_nvim_lsp"
	local lspconfig = require "lspconfig"

	cmp.setup {
		sources = {
			{name = "nvim_lsp"}
		},
		mapping = cmp.mapping.preset.insert()
	}
	local caps = vim.lsp.protocol.make_client_capabilities()
	caps = cmp_lsp.default_capabilities(caps)

	local opts = {noremap = true, silent = true}
	local function nn(from, to) vim.api.nvim_set_keymap("n", from, to, opts) end
	nn("<Leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>")
	nn("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
	nn("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")

	local function onattach(client, buf)
		local function nn(from, to)
			vim.api.nvim_buf_set_keymap(buf, "n", from, to, opts)
		end
		nn("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
		nn("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
		nn("<Leader>K", "<cmd>lua vim.lsp.buf.hover()<CR>")
		nn("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
		nn("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		nn("<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
		nn("<Leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>")
		nn("<Leader>A", "<cmd>lua vim.lsp.buf.code_action()<CR>")
		nn("<Leader>R", "<cmd>lua vim.lsp.buf.references()<CR>")
		nn("<Leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
	end
	local servers = {"clangd"} -- add others here if you use them!
	for _, lsp in pairs(servers) do
		lspconfig[lsp].setup {
			capabilities = caps,
			on_attach = onattach,
			flags = {debounce_text_changes = 500}
		}
	end
EOF
endfunction

au VimEnter * call s:InitLSP()
