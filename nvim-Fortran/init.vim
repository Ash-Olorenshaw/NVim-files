source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nyoom-engineering/oxocarbon.nvim'
	Plug 'aliqyan-21/darkvoid.nvim'
	Plug 'jacoborus/tender.vim'
call plug#end()

lua << EOF
	TreesitterConfigure({ "fortran" }, true)
	vim.lsp.enable("fortls")
EOF


set tabstop=4
set shiftwidth=4

set termguicolors
syntax enable
colorscheme tender
