local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("not ok")
  return
end

packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("tpope/vim-commentary")
  use("lewis6991/gitsigns.nvim")

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('ray-x/lsp_signature.nvim')

  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use('tpope/vim-fugitive')
  use('rhysd/committia.vim')

  use('neovim/nvim-lspconfig')
  use('j-hui/fidget.nvim')

  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')

  use('christoomey/vim-tmux-navigator')

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  -- use 'romgrk/nvim-treesitter-context'

  use('frazrepo/vim-rainbow')

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'shaunsingh/nord.nvim'
  use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'
  use { "ellisonleao/gruvbox.nvim" }
  -- use 'github/copilot.vim'
  use 'Exafunction/codeium.vim'
  use { "catppuccin/nvim", as = "catppuccin" }

  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  use 'stevearc/dressing.nvim'

  use 'stevearc/oil.nvim'

  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }

  -- use { 'nvim-java/nvim-java',
  --   requires = {
  --     'nvim-java/lua-async-await',
  --     'nvim-java/nvim-java-core',
  --     'nvim-java/nvim-java-test',
  --     'nvim-java/nvim-java-dap',
  --     'MunifTanjim/nui.nvim',
  --     'neovim/nvim-lspconfig',
  --     'mfussenegger/nvim-dap',
  --     'williamboman/mason.nvim',
  --   },
  -- }

  use {
    'epwalsh/obsidian.nvim',
    tag = "*",
    requires = {
      'nvim-lua/plenary.nvim',
    }
  }

  use {
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
  }

  use 'echasnovski/mini.nvim'
  use "rebelot/kanagawa.nvim"
  use "yujinyuz/gitpad.nvim"



  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
