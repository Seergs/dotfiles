local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<leader>ve", ":edit ~/.config/nvim/init.lua<CR>", opts)
keymap("n", "<leader>vr", ":source ~/.config/nvim/init.lua<CR>", opts)

-- Allow to open non-existent files
keymap("", "gf", ":edit <cfile><CR>", opts)

-- Reselect visual selection after indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Mantain the cursor position when yanking a visual selection
keymap("v", "y", "myy`y", opts)
keymap("v", "Y", "myY`y", opts)

-- Paste replace visual selection without copying it
keymap("v", "p", "\"_dP", opts)

-- Open the current file in the default program
keymap("n", "<leader>x", ":!xdg-open %<cr><CR>", opts)

-- Quickly insertion of a trailing ; or , from insert mode
keymap("i", ";;", "<Esc>A;<Esc>", opts)
keymap("i", ",,", "<Esc>A,<Esc>", opts)

-- Now handled with harpoon
-- keymap("n", "<leader>1", ":bfirst<CR>", opts)
-- keymap("n", "<leader>2", ":bfirst<CR>:bn", opts)
-- keymap("n", "<leader>3", ":bfirst<CR>:2bn", opts)
-- keymap("n", "<leader>4", ":bfirst<CR>:3bn", opts)
-- keymap("n", "<leader>5", ":bfirst<CR>:4bn", opts)

keymap("t", "<leader><Esc>", "<C-\\><C-n>", opts)

keymap("i", "<C-c>", "<Esc>", opts)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "<leader>n", ":UndotreeShow<CR>", opts)
keymap("n", "<CR>", ":noh<CR><CR>",opts)
