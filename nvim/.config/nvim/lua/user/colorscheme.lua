local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
  print("Colorscheme not ready")
  return
end

catppuccin.setup()

vim.cmd([[
  set background=dark
  colorscheme catppuccin
]])
