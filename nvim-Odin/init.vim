call plug#begin("/mnt/D-Files/plugged/")

Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'kylechui/nvim-surround'

Plug 'lewis6991/gitsigns.nvim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }


Plug 'neovim/nvim-lspconfig'
Plug 'ishan9299/modus-theme-vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

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

    require('gitsigns').setup()

    require "nvim-surround".setup {}

    -- LSP setup
    local lspconfig = require('lspconfig')
    lspconfig.ols.setup({})

    require 'nvim-treesitter.install'.prefer_git = false

    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "odin"},

        sync_install = false,

        auto_install = true,

        highlight = {
            enable = true,
            -- disable treesitter highlighting if file is bigger than 100 KB

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

EOF
"
" turn line numbers on and disable word wrapping
set number
set wrap!

" make tabs/indents = 4 space width
set tabstop=4
set shiftwidth=4

" set indent stuff
set list
set listchars=tab:➢\ 
" ➔\ 
" ➫\ 
" ➢\ 
" ☞\ 
" →-

" set leader char to be \
let mapleader = "\<Space>"

" Show NERDTree
let NERDTreeShowHidden = 1

" create shell command
set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>

" set colour
colorscheme modus-vivendi
