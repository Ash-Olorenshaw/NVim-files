call plug#begin("/mnt/D-Files/plugged/")

" Java LSP
Plug 'nvim-java/lua-async-await'
Plug 'nvim-java/nvim-java-refactor'
Plug 'nvim-java/nvim-java-core'
Plug 'nvim-java/nvim-java-test'
Plug 'nvim-java/nvim-java-dap'

Plug 'mfussenegger/nvim-dap'
Plug 'neovim/nvim-lspconfig'
Plug 'MunifTanjim/nui.nvim'
Plug 'williamboman/mason.nvim'
Plug 'nvim-java/nvim-java' 
Plug 'JavaHello/spring-boot.nvim'
" END of Java LSP

" Tree and comment stuff
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

" Auto bracketpairs, etc.
Plug 'jiangmiao/auto-pairs'

" colour
Plug 'glepnir/zephyr-nvim'

call plug#end() 

" nvim-Java specific settings
lua require("lua_settings")

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

" fuzzy search:
nnoremap <leader>fx <cmd>Explore<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" end of fuzzy search

" NERDTree cmds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p

lua << EOF

require "nvim-surround".setup {}

EOF

" turn line numbers on and disable word wrapping
set number
set wrap!

" make tabs/indents = 4 space width
set tabstop=4
set shiftwidth=4

" set leader char to be \
let mapleader = "\<Space>"

" Show NERDTree
let NERDTreeShowHidden = 1

colorscheme zephyr
set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>


