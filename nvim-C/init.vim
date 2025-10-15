source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
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
