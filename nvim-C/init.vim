call plug#begin("/mnt/D-Files/plugged")

" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'kylechui/nvim-surround'

Plug 'lewis6991/gitsigns.nvim'

" nice infobar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

" Pretty colours
Plug 'cpea2506/one_monokai.nvim'
Plug 'PyGamer0/darc.nvim'
Plug 'rktjmp/lush.nvim'

call plug#end()

let mapleader = "\<Space>"

autocmd BufNewFile,BufRead *.mq4 set filetype=mq4

" let g:python3_host_prog = 'D:\Python\nvim-venv\venv\Scripts\python'
let g:deoplete#enable_at_startup = 1

" fuzzy search:
nnoremap <leader>fx <cmd>Explore<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" end of fuzzy search

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

" NERDTree cmds
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

autocmd VimEnter * NERDTree | wincmd p

" Autocomplete suggestions, etc:
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

lua << EOF

	require "cmp_config"
	require "ts_config"

	require "nvim-surround".setup {}
	require 'nvim-treesitter.install'.prefer_git = false
	require "gitsigns" .setup {}

	vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })

EOF

" turn line numbers on and disable word wrapping
set number
set wrap!

" make tabs/indents = 4 space width
set tabstop=4
set shiftwidth=4

" set indent stuff
set list
set listchars=tab:➔\ 
" ➔\ 
" ➫\ 
" ➢\ 
" ☞\ 
" →-


" Show NERDTree
let NERDTreeShowHidden = 1

" set colours
" colorscheme one_monokai
colorscheme darc
set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>


