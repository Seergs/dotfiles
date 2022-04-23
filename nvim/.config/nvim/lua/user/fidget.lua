local ok, fidget = pcall(require, "fidget")
if not ok then
  print("Fidge not ready")
  return
end

fidget.setup({
  text = {
    spinner =  "dots"
  },
  window = {
    relative = "win",
    blend = 0
  }
})
