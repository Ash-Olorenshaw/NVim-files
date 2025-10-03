
vim.treesitter.language.register("clojure", "clojure-dart")

require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "clojure", "lua", "vim", "vimdoc", "query", "php", "dockerfile"},
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
