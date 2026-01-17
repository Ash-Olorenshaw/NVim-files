source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'stevearc/dressing.nvim'
	Plug 'nvim-flutter/flutter-tools.nvim'
	Plug 'tpope/vim-fireplace'

	Plug 'pappasam/papercolor-theme-slim'
call plug#end()

lua << EOF
	TreesitterConfigure({ "clojure" })
	vim.treesitter.language.register("clojure", "clojure-dart")

	vim.lsp.config("clojure_lsp", {
		capabilities = vim.g.cmp_capabilities,
		filetypes = { "clojure", "clojure-dart", "edn" }
	})

	vim.lsp.enable("clojure_lsp")
EOF

set encoding=UTF-8
autocmd BufNewFile,BufRead *.cljd set filetype=clojure-dart

set tabstop=4
set shiftwidth=4
set noexpandtab
set nosmartindent

colorscheme PaperColorSlim
