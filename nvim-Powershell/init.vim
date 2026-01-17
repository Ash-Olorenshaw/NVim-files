source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'Yagua/nebulous.nvim'
call plug#end()

lua << EOF
	require "cmp_setup"

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
	TreesitterConfigure({ "vim", "powershell" })
EOF

set tabstop=4
set shiftwidth=4
syntax enable
syntax on

if (has("termguicolors"))
    set termguicolors
endif

