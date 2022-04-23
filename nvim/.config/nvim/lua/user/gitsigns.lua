local ok, gitsigns = pcall(require, "gitsigns")
if not ok then
  print("Gitsigns not ready")
  return
end

gitsigns.setup()
