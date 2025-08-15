call plug#begin("/mnt/D-Files/plugged")

" deps:
Plug 'nvim-lua/plenary.nvim'

" NERDTree and icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" utils
Plug 'kylechui/nvim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lewis6991/gitsigns.nvim'

" TS, Telescope, Porthole
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'ash-olorenshaw/porthole.nvim'

" AUTOCOMPLETION
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" see: https://github.com/hrsh7th/nvim-cmp for more details

Plug 'tanvirtin/monokai.nvim'

call plug#end()


let mapleader = "\<Space>"

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" end of fuzzy search

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p


lua << EOF
	require "cmp_setup"
	require "treesitter_setup"
	require "nvim-surround".setup {}
	require "gitsigns" .setup {}

	vim.g.markdown_fenced_languages = {
	  "ts=typescript"
	}

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local lspconfig = require('lspconfig')

	lspconfig['svelte'].setup {
		capabilities = capabilities
	}

	--require("typescript-tools").setup {
	--	capabilities = capabilities
	--}

	lspconfig['vscode-eslint-language-server'].setup{
		capabilities = capabilities
	}
	lspconfig['denols'].setup {
		capabilities = capabilities
	}
	lspconfig['html'].setup{
		capabilities = capabilities,
	}

	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })
EOF

set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

set number
set wrap!

" make tabs/indents = 4 space width
set tabstop=4
set shiftwidth=4

" set indent stuff
set list
set listchars=tab:➔\ 

colorscheme monokai_ristretto
syntax on
