call plug#begin("/mnt/D-Files/plugged")
	source ~/.config/nvim/common/common_setup.vim
	source ~/.config/nvim/common/neotree_setup.vim

	Plug 'Shougo/ddc.vim'
	Plug 'vim-denops/denops.vim'

	Plug 'ash-olorenshaw/porthole.nvim'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'Mofiqul/dracula.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'maxmx03/fluoromachine.nvim'
	Plug 'neovim/nvim-lspconfig'
call plug#end()

let mapleader = "\<Space>"

let g:python3_host_prog = 'D:\Python\nvim-venv\venv\Scripts\python'
" Porthole
nnoremap <leader>pp :Porthole<CR>

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


lua << EOF
	require 'ts_setup'
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
set tabstop=4
set shiftwidth=4

colorscheme dracula

