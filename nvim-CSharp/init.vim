source ~/.config/nvim/common/setup.vim

call plug#begin(g:plugin_location)
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/treesitter_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'ash-olorenshaw/porthole.nvim'

	" lsp
	Plug 'OmniSharp/omnisharp-vim'
	" snippets
	Plug 'SirVer/ultisnips'
	" lint
	Plug 'dense-analysis/ale'
	" completion
	Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

	Plug 'AlexvZyl/nordic.nvim', { 'branch': 'main' }
call plug#end()

" LSP
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_want_snippet=1
" lint
let g:ale_linters = { 'cs': ['OmniSharp']}
" completion
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" info
nnoremap K :OmniSharpDocumentation<CR>

let mapleader = "\<Space>"

lua << EOF
	TreesitterConfigure( { "c_sharp" }, true )

	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })
EOF

set tabstop=4
set shiftwidth=4

colorscheme nordic
