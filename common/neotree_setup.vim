" NERDTree cmds
nnoremap <leader>gg :Neotree action=show source=git_status position=float<CR>
nnoremap <leader>bb :Neotree action=show source=buffers position=float<CR>
nnoremap <C-t> :Neotree show<CR>

Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-tree/nvim-web-devicons'

lua << EOF
	vim.api.nvim_create_autocmd("VimEnter", {
		pattern = { "*" },
		callback = function()
			require('neo-tree').setup({
				filesystem = {
					filtered_items = {
						visible = true,
					}
				},
				window = {
					mappings = {
						["h"] = function(state)
							local node = state.tree:get_node()
							if node.type == 'directory' and node:is_expanded() then
								require'neo-tree.sources.filesystem'.toggle_directory(state, node)
							else
								require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
							end
						end,
						["l"] = function(state)
							local node = state.tree:get_node()
							if require("neo-tree.utils").is_expandable(node) then
								state.commands["toggle_node"](state)
							else
								state.commands['open'](state)
								vim.cmd('Neotree reveal')      
							end
						end,
					}
				}
			})
		end
	})
EOF

echom "'neotree_setup' loaded"
autocmd VimEnter * Neotree show
