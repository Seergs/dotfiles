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

    -- use('neovim/nvim-lspconfig')
    use('j-hui/fidget.nvim')

    use('nvim-lua/plenary.nvim')
    use('nvim-telescope/telescope.nvim')

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

    use { 'tzachar/cmp-tabnine', run = './install.sh', requires = 'hrsh7th/nvim-cmp' }
    use 'mbbill/undotree'
    use 'ThePrimeagen/harpoon'

    use "williamboman/mason.nvim"
    -- use "williamboman/mason-lspconfig.nvim"

    use 'stevearc/oil.nvim'

    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

    use { 'nvim-java/nvim-java',
        requires = {
            'nvim-java/lua-async-await',
            'nvim-java/nvim-java-core',
            'nvim-java/nvim-java-test',
            'nvim-java/nvim-java-dap',
            'MunifTanjim/nui.nvim',
            'neovim/nvim-lspconfig',
            'mfussenegger/nvim-dap',
            'williamboman/mason.nvim',
            'nvim-java/nvim-java-refactor',
            'JavaHello/spring-boot.nvim'
        },
    }

    use {
        'epwalsh/obsidian.nvim',
        tag = "*",
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }

    use 'echasnovski/mini.nvim'
    use "zeioth/garbage-day.nvim"
    use 'sainnhe/gruvbox-material'

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
