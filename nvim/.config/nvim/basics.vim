syntax enable
set number
set mouse=a
set clipboard+=unnamedplus
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set laststatus=2
set noshowmode
set scrolloff=10
set ignorecase
set noswapfile
set noerrorbells
set splitright
set splitbelow
set linespace=5

if has("patch-8.1.1564")
  set signcolumn=number
endif

if has("termguicolors")
  set termguicolors
endif
