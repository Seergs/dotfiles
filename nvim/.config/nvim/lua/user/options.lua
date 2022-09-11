local options = {
  number = true,
  mouse = "a",
  clipboard = "unnamedplus",
  showcmd = true,
  ruler = true,
  cursorline = true,
  encoding = "utf-8",
  showmatch = true,
  sw = 2,
  hidden = true,
  backup = false,
  writebackup = false,
  cmdheight = 2,
  updatetime = 50,
  shortmess = "c",
  laststatus = 2,
  showmode = false,
  scrolloff = 10,
  sidescrolloff = 8,
  ignorecase= true,
  swapfile = false,
  errorbells = false,
  splitright = true,
  splitbelow = true,
  linespace = 5,
  signcolumn = "yes",
  termguicolors = true,
  relativenumber = true,
  colorcolumn = "80",

  --guicursor = "",
  tabstop = 4,
  softtabstop= 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  autoindent = true,
  wrap = false,
  incsearch = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
