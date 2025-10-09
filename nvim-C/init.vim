call plug#begin('/mnt/D-Files/plugged')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	" LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'
	" END OF LSP

	Plug 'Yazeed1s/oh-lucy.nvim'	
call plug#end()

autocmd BufNewFile,BufRead *.mq4 set filetype=mq4

lua << EOF
	require 'ts_config'

	vim.lsp.config("clangd", {
		capabilities = vim.g.cmp_capabilities,
		cmd = {'clangd', '--background-index', '--clang-tidy', '--log=verbose', "--header-insertion=never"},
		init_options = {
			fallbackFlags = { '-std=c++17' },
		},
		filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
	})

	vim.lsp.enable("clangd")
EOF


set tabstop=4
set shiftwidth=4

colorscheme oh-lucy
