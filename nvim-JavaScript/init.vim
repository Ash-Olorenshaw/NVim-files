source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'windwp/nvim-ts-autotag'
	Plug 'tanvirtin/monokai.nvim'
call plug#end()

lua << EOF
	vim.g.markdown_fenced_languages = { "ts=typescript" }
	TreesitterConfigure( { "lua", "svelte", "html", "typescript", "css", "javascript", "markdown", "yaml" }, false )

	vim.lsp.config('*', { capabilities = vim.g.cmp_capabilities })

	vim.lsp.enable("cssls")
	vim.lsp.enable("ts_ls")
	vim.lsp.enable("html")
	vim.lsp.enable("svelte")
	vim.lsp.enable("denols")
	vim.lsp.enable("eslint")

	require 'nvim-ts-autotag' .setup {}
EOF

set tabstop=4
set shiftwidth=4

colorscheme monokai_ristretto
syntax on
