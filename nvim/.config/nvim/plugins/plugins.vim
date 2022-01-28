" Statusline
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'

" Autopairs
Plug 'Raimondi/delimitMate'

" Commentary
Plug 'tpope/vim-commentary'

" Completion (lsp)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer' 
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

" Emment
Plug 'mattn/emmet-vim'

" Floaterm
Plug 'voldikss/vim-floaterm'

let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

augroup FloatermCustomisations
    autocmd!
    autocmd ColorScheme * highlight FloatermBorder guibg=none
augroup END


" Formatting
Plug 'sbdchd/neoformat'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

augroup markdownSpell
  autocmd!
  autocmd FileType markdown,latex,tex set spell
augroup END


" Lsp
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'j-hui/fidget.nvim'

" Tree finder
" Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kyazdani42/nvim-tree.lua'

" let NERDTreeQuitOnOpen=1
" let NERDTreeShowHidden=1
" let NERDTreeMinimalUI=1

" let g:NERDTreeDirArrowExpandable = '▹'
" let g:NERDTreeDirArrowCollapsible = '▿'

" nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
" nmap <leader>N :NERDTreeFind<CR>


" Init dashboard
Plug 'mhinz/vim-startify'


" Surround
Plug 'machakann/vim-sandwich'

" Telescope <3
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gi <cmd>Telescope lsp_implementations<cr>
nnoremap <leader>ca <cmd>Telescope lsp_code_actions<cr>
nnoremap <leader>dl <cmd>Telescope diagnostics<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>


" Tmux navigator
Plug 'christoomey/vim-tmux-navigator'

" Color scheme
Plug 'embark-theme/vim', {'as': 'embark', 'branch': 'main'}
augroup ThemeOverrides
  autocmd!
  autocmd User PlugLoaded ++nested colorscheme embark
augroup end

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Vim rainbow
Plug 'frazrepo/vim-rainbow'

let g:rainbow_active=1
