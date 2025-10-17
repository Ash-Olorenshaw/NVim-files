source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
	Plug 'EdenEast/nightfox.nvim'
call plug#end()

lua << EOF
	TreesitterConfigure( { "markdown" }, true )

	require('nvim-treesitter.parsers').get_parser_configs().fsharp = {
		install_info = {
			url = 'https://github.com/ionide/tree-sitter-fsharp',
			branch = 'main',
			files = { 'src/scanner.c', 'src/parser.c' },
			location = "fsharp"
		},
		requires_generate_from_grammar = false,
		filetype = 'fsharp',
	}

	vim.lsp.config("fsautocomplete", {
		capabilities = vim.g.cmp_capabilities,
		cmd = { "/home/ao/.dotnet/tools/fsautocomplete", "--adaptive-lsp-server-enabled" }
	})
	vim.lsp.enable("fsautocomplete")
EOF

" set up the F# tab = space thing
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=1

colorscheme nordfox
