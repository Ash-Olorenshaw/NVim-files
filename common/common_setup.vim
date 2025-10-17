Plug 'kylechui/nvim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}

function CommonSetup()
	lua require "ibl" .setup { indent = { char = "➔" } }
	lua require "nvim-surround" .setup {}
	lua require "gitsigns" .setup {}
endfunction

augroup common_setup
    autocmd VimEnter * call CommonSetup()
augroup END

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope resume<cr>

lua vim.diagnostic.config({ virtual_text = true, virtual_lines = { current_line = true }, })

set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>tt <cmd>SplitTerminal<cr>

command SplitCurrentWindow vsplit | b#
nnoremap <leader>s <cmd>SplitCurrentWindow<cr>

" System keyboard copy
noremap <C-c> "+y
noremap <C-v> "+p

set number
set wrap!

