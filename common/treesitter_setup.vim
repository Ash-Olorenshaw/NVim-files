Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

lua <<EOF
	function _G.TreesitterConfigure(parsers)
		require'nvim-treesitter'.install(parsers)
	end
EOF
