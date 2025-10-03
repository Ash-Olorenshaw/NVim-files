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

