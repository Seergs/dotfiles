source ~/.config/nvim/basics.vim
source ~/.config/nvim/mappings.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
source ~/.config/nvim/plugins/plugins.vim
call plug#end()
doautocmd User PlugLoaded

lua <<EOF
require('lualine').setup()
require('bufferline').setup()
require('nvim-tree').setup()
require('completion')
require('lsp')
require('treesitter')
require('telescope-config')
EOF
