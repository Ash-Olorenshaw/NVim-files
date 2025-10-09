call plug#begin('/mnt/D-Files/plugged')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	source ~/.config/nvim/common/common_setup.vim
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

	Plug 'PyGamer0/darc.nvim'
call plug#end()

autocmd BufNewFile,BufRead *.mq4 set filetype=mq4

lua << EOF
	require 'cmp_config'
	require 'ts_config'
EOF


set tabstop=4
set shiftwidth=4

colorscheme darc

