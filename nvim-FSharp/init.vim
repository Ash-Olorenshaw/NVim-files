
call plug#begin('/mnt/D-Files/plugged')

" LSP and language client
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'neovim/nvim-lspconfig'
" Plug 'ionide/Ionide-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

source ~/.config/nvim/common/common_setup.vim
source ~/.config/nvim/common/neotree_setup.vim

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

lua << EOF
	require "cmp_setup"
	require "treesitter_setup"
EOF

" set up the F# tab thing because it's a pain otherwise:
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=1


colorscheme nordfox
