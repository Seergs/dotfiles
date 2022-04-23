local fn = vim.fn

local install_path = fn.stdpath("data") .. "~/.local/share/nvim/site/pack/packer/start/packer.nvim"
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
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })
  use("nvim-lualine/lualine.nvim")
  use("kyazdani42/nvim-web-devicons")
  use("akinsho/bufferline.nvim")
  use("Raimondi/delimitMate")
  use("tpope/vim-commentary")

  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')
  use('ray-x/lsp_signature.nvim')

  use('mattn/emmet-vim')

  use('sbdchd/neoformat')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')

  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')
  use('rhysd/committia.vim')

  use('neovim/nvim-lspconfig')
  use('williamboman/nvim-lsp-installer')
  use('j-hui/fidget.nvim')

  use('Xuyuanp/nerdtree-git-plugin')
  use('kyazdani42/nvim-tree.lua')

  use('mhinz/vim-startify')

  use('machakann/vim-sandwich')

  use('nvim-lua/plenary.nvim')
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')

  use('christoomey/vim-tmux-navigator')

  use('sainnhe/everforest')

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use('frazrepo/vim-rainbow')

  use("karb94/neoscroll.nvim")
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
