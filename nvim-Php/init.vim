call plug#begin("/mnt/D-Files/plugged")

" autocmd VimEnter * PlugInstall --sync | source $MYVIMRC

" Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'kylechui/nvim-surround'
Plug 'lewis6991/gitsigns.nvim'

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

" NERDTree and icons
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'

Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Mofiqul/dracula.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lukas-reineke/indent-blankline.nvim', {'main': 'ibl'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Plug 'Th3Whit3Wolf/space-nvim'
" Plug 'vigoux/oak'

Plug 'ray-x/aurora'

call plug#end()

let mapleader = "\<Space>"

set termguicolors            " 24 bit color
let g:aurora_italic = 1     " italic
let g:aurora_transparent = 1     " transparent
let g:aurora_bold = 1 " bold

" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('autocomplete', false)

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

autocmd VimEnter * NERDTree | wincmd p


set number
set wrap!
let NERDTreeShowHidden = 1

lua << EOF


  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })


  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

require "nvim-surround".setup {}
require "gitsigns".setup {}

require 'nvim-treesitter.install'.prefer_git = false

-- LSP setup
local lspconfig = require('lspconfig')
-- lspconfig.phpactor.setup({
--     on_attach = on_attach,
--     capabilities = capabilities,
--     init_options = {
--         ["language_server_phpstan.enabled"] = false,
--         ["language_server_psalm.enabled"] = false,
--     }
-- 
-- })
-- LSP setup
lspconfig.intelephense.setup({
	capabilities = capabilities
})

lspconfig.vuels.setup({
  capabilities = capabilities,
  -- add filetypes for typescript, javascript and vue
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = {
    vue = {
      -- disable hybrid mode
      hybridMode = false,
    },
  },
})

require 'ibl'.setup {
    indent = { char = "➢" },
}

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

EOF

" set blade filetype
augroup BladeFiltypeRelated
  au BufNewFile,BufRead *.blade.php set ft=blade
augroup END

" colorscheme space-nvim
" colorscheme oak
colorscheme aurora
" set termwinsize=20x0

set encoding=UTF-8

set shell=pwsh
command SplitTerminal :set splitbelow | split | resize 20 | term
nnoremap <leader>t <cmd>SplitTerminal<cr>


