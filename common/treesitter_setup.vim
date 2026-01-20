Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

lua <<EOF
	function _G.TreesitterConfigure(parsers)
		require'nvim-treesitter'.install(parsers)
		require'nvim-treesitter'.setup {
			install_dir = '~/.local/share/nvim/site'
		}
		vim.api.nvim_create_autocmd('FileType', {
			pattern = parsers,
			callback = function() vim.treesitter.start() end,
		})
	end
EOF

