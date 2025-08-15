call plug#begin("/mnt/D-Files/plugged")

Plug 'kylechui/nvim-surround'
Plug 'ash-olorenshaw/porthole.nvim'

Plug 'tpope/vim-fireplace'

" NERDTree and icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}

Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
" Flutter
Plug 'stevearc/dressing.nvim' " optional for vim.ui.select
Plug 'nvim-flutter/flutter-tools.nvim'
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

" Potential other theme:
Plug 'pappasam/papercolor-theme-slim'

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

	require 'ibl'.setup {
		indent = { char = "➢" },
	}

	vim.treesitter.language.register("clojure", "clojure-dart")
	require 'nvim-treesitter.install'.prefer_git = false
	require 'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "clojure", "lua", "vim", "vimdoc", "query", "php", "dockerfile"},
		sync_install = false,
		auto_install = true,

        indent = {
            enable = false
        },

		highlight = {
			enable = true,
			disable = function(lang, buf)
				local max_filesize = 500 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,

			additional_vim_regex_highlighting = false,
		},
	}
	require "nvim-surround".setup {}

	require "porthole-nvim".setup {
		width_ratio = 0.2,
		height_ratio = 0.2,
		quit_key = 'q',
		reload_key = 'r',
		action_key = '<CR>',
		use_icons = true
	}
	
EOF

set encoding=UTF-8

autocmd BufNewFile,BufRead *.cljd set filetype=clojure-dart

set number
set wrap!
set list

set tabstop=4
set shiftwidth=4
set noexpandtab
set nosmartindent

au VimEnter *  NERDTree
let NERDTreeShowHidden = 1

set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>

colorscheme PaperColorSlim
