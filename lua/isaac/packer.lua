-- This file can be loaded by calling `lua require('plugins')` from your init.vim


-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

--[[  use ({
	'folke/tokyonight.nvim',
  	as = 'tokyonight',
	config = function()
		vim.cmd('colorscheme tokyonight-night')
	end
  }) --]]

  use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
  }

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }

  use('nvim-treesitter/playground')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('tpope/vim-surround')
  use({
      "folke/noice.nvim",
      requires = {
          -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
          "MunifTanjim/nui.nvim",
          -- OPTIONAL:
          --   `nvim-notify` is only needed, if you want to use the notification view.
          --   If not available, we use `mini` as the fallback
          "rcarriga/nvim-notify",
      }
  })

  use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }
  use ("m4xshen/smartcolumn.nvim")
  use ('nvim-tree/nvim-web-devicons')
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  use ('sindrets/winshift.nvim')
  use { 'rmagatti/auto-session', requires = {'rmagatti/session-lens', 'nvim-telescope/telescope.nvim'} }
  use ('nyoom-engineering/oxocarbon.nvim')
  use { "catppuccin/nvim", as = "catppuccin" }
  use ('ThePrimeagen/git-worktree.nvim')
  use "nvim-lua/plenary.nvim"
  use "nvim-lua/popup.nvim"
  use "nvim-telescope/telescope-fzy-native.nvim"

  use {
	  'goolord/alpha-nvim',
	  config = function ()
		  require'alpha'.setup(require'alpha.themes.dashboard'.config)
	  end
  }

  use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use({ 
	"iamcco/markdown-preview.nvim", 
    run = "cd app && npm install", 
	setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
	ft = { "markdown" }, 
  })

end)

