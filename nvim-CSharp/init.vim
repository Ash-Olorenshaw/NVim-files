call plug#begin("/mnt/D-Files/plugged")

Plug 'kylechui/nvim-surround'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
" nice infobar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'OmniSharp/omnisharp-vim'
Plug 'dense-analysis/ale'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'ash-olorenshaw/porthole.nvim'

" Pretty colours
Plug 'cpea2506/one_monokai.nvim'

call plug#end()

let g:deoplete#enable_at_startup = 1

let g:OmniSharp_server_stdio = 0
let g:OmniSharp_server_use_net6 = 1
let g:ale_linters = { 'cs': ['OmniSharp']}

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
nnoremap <leader>pp :Porthole<CR>
nnoremap <C-k> :OmniSharpDocumentation<CR>

autocmd VimEnter * NERDTree | wincmd p
"
" Autocomplete suggestions, etc:
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



lua << EOF

require "nvim-surround".setup {}

require 'nvim-treesitter.install'.prefer_git = false

-- Set colouring
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "csharp", "lua", "vim", "vimdoc"},

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

vim.treesitter.language.register("markdown", "text")

EOF

" turn line numbers on and disable word wrapping
set number
set wrap!

" make tabs/indents = 4 space width
set tabstop=4
set shiftwidth=4

" set indent stuff
set list
set listchars=tab: ➢\ 
" ➔\ 
" ➫\ 
" ➢\ 
" ☞\ 
" →-

" set leader char to be \
let mapleader = "\<Space>"

" Show NERDTree
let NERDTreeShowHidden = 1

" set colours
colorscheme one_monokai
set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>


