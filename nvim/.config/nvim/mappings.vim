let mapleader = "\<space>"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Allow to open non-existent files
map gf :edit <cfile><cr>


" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Mantain the cursor position when yanking a visual selection
vnoremap y myy`y
vnoremap Y myY`y

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quickly escape to normal mode
imap jj <esc>

" Quickly insertion of a trailing ; or , from insert mode
imap ;; <Esc>A;<Esc>
imap ,, <Esc>A,<Esc>

nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>
nmap <leader>5 :bfirst<CR>:4bn<CR>
