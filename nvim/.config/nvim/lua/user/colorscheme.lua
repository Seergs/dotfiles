require("catppuccin").setup({
    transparent_background = true,
    integrations = {
        cmp = true,
        treesitter = true,
        fidget = true
    }
})

vim.cmd([[
  colorscheme catppuccin
]])



