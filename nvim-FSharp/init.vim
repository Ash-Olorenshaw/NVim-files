source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'EdenEast/nightfox.nvim'
call plug#end()

lua << EOF
	require "treesitter_setup"

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
