call plug#begin("/mnt/D-Files/plugged/")
" Plug 'Ash-Olorenshaw/Porthole.nvim'
Plug '/mnt/D-Files/langs/VimScript/test-plugin/'

call plug#end()

" lua << EOF
" require "porthole-nvim".setup {
" 	width_ratio = 0.2,
" 	height_ratio = 0.2,
" 	quit_key = 'q',
" 	reload_key = 'r',
" 	action_key = '<CR>',
" 	use_icons = true
" }
" EOF

