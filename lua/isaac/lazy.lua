-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  { 'CRAG666/code_runner.nvim', dependencies = 'nvim-lua/plenary.nvim' },
  {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  { 'rmagatti/auto-session', dependencies = {'rmagatti/session-lens', 'nvim-telescope/telescope.nvim'} },
  { "catppuccin/nvim", name = "catppuccin" },

  'nvim-treesitter/playground',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  'tpope/vim-surround',
  'tpope/vim-abolish',
  'tpope/vim-scriptease',
  "m4xshen/smartcolumn.nvim",
  'nvim-tree/nvim-web-devicons',
  'sindrets/winshift.nvim',
  'nyoom-engineering/oxocarbon.nvim',
  'ThePrimeagen/git-worktree.nvim',
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope-fzy-native.nvim",
  'ThePrimeagen/harpoon',
  'folke/neodev.nvim',
  'xiyaowong/transparent.nvim',
  'echasnovski/mini.nvim',
  'stevearc/aerial.nvim',
  'NvChad/nvim-colorizer.lua',
  'roobert/tailwindcss-colorizer-cmp.nvim',
  'MunifTanjim/prettier.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'isaac238/terminal_run.nvim',
  --'/home/isaac238/Personal/Development/terminal_run.nvim',

  {
	  'goolord/alpha-nvim',
	  config = function ()
		  require'alpha'.setup(require'alpha.themes.dashboard'.config)
	  end
  },

  {
	  'nvim-lualine/lualine.nvim',
	  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
  },

  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && npm install",
      init = function()
          vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
  },

  {
	  'nvim-telescope/telescope.nvim',
	  dependencies = { {'nvim-lua/plenary.nvim'} }
  },

  {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate'
  },

  {
	  'hrsh7th/nvim-cmp',
	  lazy = false,
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  },

  {
      "folke/noice.nvim",
      dependencies = {
          "MunifTanjim/nui.nvim",
      }
  }
})

