
call plug#begin('/mnt/D-Files/plugged')

" LSP and language client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'neovim/nvim-lspconfig'
" Plug 'ionide/Ionide-vim'

" misc stuff, nerdtree, gitsigns, telescope, treesitter
Plug 'scrooloose/nerdtree'
Plug 'kylechui/nvim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}

" color
Plug 'EdenEast/nightfox.nvim'

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
	require "ibl" .setup { indent = { char = "➔" } }
	require "cmp_setup"
	require "treesitter_setup"

	local lspconfig = require "lspconfig"
	lspconfig.fsautocomplete.setup({ cmd = { "/home/ao/.dotnet/tools/fsautocomplete", "--adaptive-lsp-server-enabled" } })

	require "nvim-surround" .setup {}
	require "gitsigns" .setup {}

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

" set up the F# tab thing because it's a pain otherwise:
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=1


colorscheme nordfox
