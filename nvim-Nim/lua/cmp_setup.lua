-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
    snippet = {
    	expand = function(args)
    		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
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
    	['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
    	{ name = 'nvim_lsp' },
    	{ name = 'vsnip' },
    }, {
    	{ name = 'buffer' },
    })
  })

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config("*" {
	capabilities = capabilities
})

vim.lsp.enable("nim_langserver")
vim.lsp.enable("html")
vim.lsp.enable("ccls")
vim.lsp.enable("ts_ls")

