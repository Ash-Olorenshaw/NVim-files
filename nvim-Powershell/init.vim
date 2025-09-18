call plug#begin("/mnt/D-Files/plugged/")
	Plug 'ash-olorenshaw/porthole.nvim'

	Plug 'kylechui/nvim-surround'

	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

	Plug 'jiangmiao/auto-pairs'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

	Plug 'Yagua/nebulous.nvim'

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
call plug#end()

let mapleader = "\<Space>"

call common#load()

lua << EOF
	require "cmp_setup"
	require "ts_setup"

	require("nebulous").setup {
		variant = "midnight",
		disable = {
			background = true,
			endOfBuffer = false,
			terminal_colors = false,
		},
		italic = {
			comments   = true,
			keywords   = false,
			functions  = false,
			variables  = true,
		},
	}

	require "nvim-surround".setup {}

	require 'ibl'.setup {
		indent = { char = "➢" },
	}
EOF

if (has("termguicolors"))
    set termguicolors
endif

