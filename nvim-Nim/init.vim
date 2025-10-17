source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/cmp_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'everviolet/nvim', { 'as': 'evergarden' }
call plug#end()

lua << EOF
	require 'evergarden'.setup {
		theme = {
			variant = 'fall',
			accent = 'green',
		},
		editor = {
			transparent_background = false,
			override_terminal = true,
			sign = { color = 'none' },
			float = {
				color = 'mantle',
				invert_border = false,
			},
			completion = {
				color = 'surface0',
			},
		},
		style = {
			tabline = { 'reverse' },
			search = { 'italic', 'reverse' },
			incsearch = { 'italic', 'reverse' },
			types = { 'italic' },
			keyword = { 'italic' },
			comment = { 'italic' },
		},
		overrides = {},
		color_overrides = {},
	}

	TreesitterConfigure({ "nim", "html", "css", "typescript", "javascript" }, false)

	vim.lsp.config("*", {
		capabilities = vim.g.cmp_capabilities,
	})

	vim.lsp.enable("nim_langserver")
	vim.lsp.enable("html")
	vim.lsp.enable("ccls")
	vim.lsp.enable("ts_ls")

EOF

set encoding=UTF-8
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=1


colorscheme evergarden
