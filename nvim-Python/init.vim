call plug#begin("/mnt/D-Files/plugged")

" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'kylechui/nvim-surround'

" Minimap
" Plug 'echasnovski/mini.nvim'

" colorscheme dracula.nvim

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ash-olorenshaw/porthole.nvim'

" NERDTree and icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'maxmx03/fluoromachine.nvim'
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
Plug 'neovim/nvim-lspconfig'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'install.ps1'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }


" Plug 'jim-at-jibba/ariake-vim-colors'
Plug 'TheLeoP/powershell.nvim'

" Potential other theme:
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

let mapleader = "\<Space>"

let g:python3_host_prog = 'D:\Python\nvim-venv\venv\Scripts\python'
let g:deoplete#enable_at_startup = 1

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

" Porthole
nnoremap <leader>pp :Porthole<CR>

autocmd VimEnter * NERDTree | wincmd p

" Pyright use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


" Autocomplete suggestions, etc:
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


set number
set wrap!
let NERDTreeShowHidden = 1

lua << EOF

--Enable minimap
-- require 'mini.map'.setup()
-- MiniMap.open()

require "porthole-nvim".setup {
	width_ratio = 0.2,
	height_ratio = 0.2,
	quit_key = 'q',
	reload_key = 'r',
	action_key = '<CR>',
	use_icons = true
}

require('powershell').setup({
    bundle_path = "D:/lsp/PowerShellEditorServices",
})

require "nvim-surround".setup {}


require 'ibl'.setup {
    indent = { char = "➢" },
}

require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "query", "php", "dockerfile"},

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

vim.treesitter.language.register("dockerfile", "Dockerfile")
--local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
--autocmd({ "BufNewFile", "BufRead" }, {
--  pattern = "*.fs,*.fsx,*.fsi",
--  command = [[set filetype=fsharp]]
--})

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

colorscheme dracula
" set termwinsize=20x0

set encoding=UTF-8

set tabstop=4
set shiftwidth=4


set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>


