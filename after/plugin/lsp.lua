local lspconfig = require('lspconfig')
local cmp = require('cmp')
local cmp_lsp = require('cmp_nvim_lsp')

local nn = require('util').nn

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		-- Accept currently selected item. Set `select` to `false` to only 
		-- confirm explicitly selected items.
		['<Tab>'] = cmp.mapping.confirm({ select = true }), 
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
		{ name = 'path' },
		-- For luasnip users.
		{ name = 'luasnip' },
	},
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

local function onattach(client, buf)
	nn("gD", vim.lsp.buf.declaration)
	nn("gd", vim.lsp.buf.definition)
	nn("<Leader>K", vim.lsp.buf.hover)
	nn("gi", vim.lsp.buf.implementation)
	nn("<C-k>", vim.lsp.buf.signature_help)
	nn("<Leader>D", vim.lsp.buf.type_definition)
	nn("<Leader>r", vim.lsp.buf.rename)
	nn("<Leader>A", vim.lsp.buf.code_action)
	nn("<Leader>R", vim.lsp.buf.references)
	nn("<Leader>f", vim.lsp.buf.format)
end

local caps = vim.lsp.protocol.make_client_capabilities()
caps = cmp_lsp.default_capabilities(caps)

local servers = {'clangd', 'rust_analyzer', 'zls', 'texlab'}
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup {
		capabilities = caps,
		on_attach = onattach,
		flags = { debounce_text_changes = 500 }
	}
end
