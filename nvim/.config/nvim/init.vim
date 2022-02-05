source ~/.config/nvim/basics.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins/plugins.vim

lua <<EOF
require('lualine').setup ()
require('bufferline').setup()
require('nvim-tree').setup {
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  }
}
require('gitsigns').setup ()
require('completion')
require('lsp')
require('treesitter')
require('telescope-config')
EOF
