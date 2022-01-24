" Plug 'ghifarit53/tokyonight-vim'
"Plug 'overcache/NeoSolarized'
"Plug 'morhetz/gruvbox'
"Plug 'EdenEast/nightfox.nvim'
" Plug 'arcticicestudio/nord-vim'
Plug 'embark-theme/vim', {'as': 'embark', 'branch': 'main'}

" let g:tokyonight_transparent_background=1

augroup ThemeOverrides
  autocmd!
  autocmd User PlugLoaded ++nested colorscheme embark
augroup end
