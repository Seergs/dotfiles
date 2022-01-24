source ~/.config/nvim/basics.vim
source ~/.config/nvim/mappings.vim

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

source ~/.config/nvim/plugins/statusline.vim
source ~/.config/nvim/plugins/tabline.vim
source ~/.config/nvim/plugins/autopairs.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/cmp.vim
source ~/.config/nvim/plugins/emmet.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/formatter.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/gitgutter.vim
source ~/.config/nvim/plugins/commits.vim
source ~/.config/nvim/plugins/markdown.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/startify.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/tmux-navigator.vim
source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/vim-rainbow.vim

call plug#end()
doautocmd User PlugLoaded

lua <<EOF
require('lualine').setup()
require('bufferline').setup()
require('completion')
require('lsp')
require('treesitter')
-- require('format')
require('telescope-config')
EOF
