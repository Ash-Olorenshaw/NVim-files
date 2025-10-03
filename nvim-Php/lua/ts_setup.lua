
require 'nvim-treesitter.install'.prefer_git = false

require 'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "php", "dockerfile"},
  sync_install = false,

  auto_install = true,

  highlight = {
	enable = true,

	-- disable for large files
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

-- parser for blade filetype
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.blade = {
  install_info = {
	url = "https://github.com/EmranMR/tree-sitter-blade",
	files = {"src/parser.c"},
	branch = "main",
  },
  filetype = "blade"
}

