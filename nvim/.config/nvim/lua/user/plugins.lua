local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print("Hello")
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

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('ray-x/lsp_signature.nvim')

  use('sbdchd/neoformat')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use('tpope/vim-fugitive')
  use('rhysd/committia.vim')

  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use('j-hui/fidget.nvim')
  use('mhinz/vim-startify')

  use('machakann/vim-sandwich')

  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')

  use('christoomey/vim-tmux-navigator')

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use('frazrepo/vim-rainbow')

  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'shaunsingh/nord.nvim'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'mbbill/undotree'
  use 'ThePrimeagen/harpoon'
  use 'romgrk/nvim-treesitter-context'
  use 'luisiacc/gruvbox-baby'

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
