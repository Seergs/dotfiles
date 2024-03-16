local ok, fidget = pcall(require, "fidget")
if not ok then
  print("Fidget not ready")
  return
end

fidget.setup({
})
