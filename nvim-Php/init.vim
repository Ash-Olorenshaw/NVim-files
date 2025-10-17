source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'pmizio/typescript-tools.nvim'
	Plug 'vigoux/oak'
call plug#end()

lua << EOF
	TreesitterConfigure( { "php", "dockerfile" }, false )
	require "nvim-treesitter.parsers".get_parser_configs().blade = {
		install_info = {
			url = "https://github.com/EmranMR/tree-sitter-blade",
			files = { "src/parser.c" },
			branch = "main",
		},
		filetype = "blade"
	}

	vim.lsp.config("*", { capabilities = capabilities })
	vim.lsp.enable('intelephense')
	vim.lsp.enable('vue_ls')

	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })

EOF

set encoding=UTF-8

" set blade filetype
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END

set termguicolors            " 24 bit color
let g:aurora_italic = 1     " italic
let g:aurora_transparent = 1     " transparent
let g:aurora_bold = 1 " bold

colorscheme oak

