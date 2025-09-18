function common#load()
	" Telescope
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

	" terminal stuff
	set encoding=UTF-8
	set shell=pwsh
	command SplitTerminal :set splitbelow | split | resize 20 | term
	nnoremap <leader>t <cmd>SplitTerminal<cr>

	" indent stuff
	set tabstop=4
	set shiftwidth=4

	syntax enable
	syntax on
endfunction
