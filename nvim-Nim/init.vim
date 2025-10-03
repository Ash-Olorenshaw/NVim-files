call plug#begin("/mnt/D-Files/plugged")

" NERDTree and icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}

Plug 'lewis6991/gitsigns.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'kylechui/nvim-surround'
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
"
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

Plug 'everviolet/nvim', { 'as': 'evergarden' }
" Plug 'glepnir/zephyr-nvim'
" Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

let mapleader = "\<Space>"

" fuzzy search:
nnoremap <leader>fx <cmd>Explore<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <A-x> :lua require'telescope.actions'.file_vsplit()<cr>
" end of fuzzy search

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

" NERDTree cmds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nnoremap <C-k> :Source<CR>

" Porthole
nnoremap <leader>pp :Porthole<CR>

lua << EOF
	require "cmp_setup"
	require "ts_setup"

	require 'ibl'.setup {
		indent = { char = "➢" },
	}

	require "nvim-surround".setup {}
	require "gitsigns".setup {}

	require 'evergarden'.setup {
		theme = {
			variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
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

	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })
EOF

set encoding=UTF-8
set number
set wrap!
set list

" set up the space tab thing because it's a pain otherwise:
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=1


au VimEnter *  NERDTree
let NERDTreeShowHidden = 1

set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>

colorscheme evergarden
" colorscheme zephyr
