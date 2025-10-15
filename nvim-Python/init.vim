source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'ash-olorenshaw/porthole.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'Mofiqul/dracula.nvim'
call plug#end()

let mapleader = "\<Space>"

let g:python3_host_prog = 'D:\Python\nvim-venv\venv\Scripts\python'
" Porthole
nnoremap <leader>pp :Porthole<CR>

lua << EOF
	require 'ts_setup'
	vim.lsp.config("pyright", {
		capabilities = vim.g.cmp_capabilities,
	})

	vim.lsp.enable("pyright")
	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })

	require "porthole-nvim".setup {
		width_ratio = 0.2,
		height_ratio = 0.2,
		quit_key = 'q',
		reload_key = 'r',
		action_key = '<CR>',
		use_icons = true
	}
EOF

set encoding=UTF-8
set tabstop=4
set shiftwidth=4

colorscheme dracula

