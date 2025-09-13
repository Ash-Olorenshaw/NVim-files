
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},

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

require('nvim-treesitter.install').prefer_git = false
