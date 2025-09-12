call plug#begin("/mnt/D-Files/plugged/")

Plug 'ash-olorenshaw/porthole.nvim'

Plug 'kylechui/nvim-surround'

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

Plug 'Yagua/nebulous.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" END OF LSP
call plug#end()

let mapleader = "\<Space>"

nnoremap <leader>fx <cmd>Explore<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <A-x> :lua require'telescope.actions'.file_vsplit()<cr>

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

" NERDTree cmds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>pp :Porthole<CR>

autocmd VimEnter * NERDTree | wincmd p


set number
set wrap!
let NERDTreeShowHidden = 1


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

	require "nvim-surround".setup {}

	require 'nvim-treesitter.install'.prefer_git = false

	require 'ibl'.setup {
		indent = { char = "➢" },
	}

	require 'nvim-treesitter.configs'.setup {
	  ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},

	  sync_install = false,

	  auto_install = true,

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

	local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	parser_config.powershell = {
		install_info = {
			url = "https://github.com/airbus-cert/tree-sitter-powershell",
			branch = "main",
			files = { "src/parser.c", "src/scanner.c" }
		},
		filetype = "ps1",
		used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }
	}

EOF

if (has("termguicolors"))
    set termguicolors
endif

syntax enable
syntax on

" terminal stuff
set encoding=UTF-8
set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>

" indent stuff
set tabstop=4
set shiftwidth=4
