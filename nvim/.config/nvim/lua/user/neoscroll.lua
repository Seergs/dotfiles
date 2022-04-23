local ok, scroll = pcall(require, "neoscroll")
if not ok then
  print("Neoscroll not ready")
  return
end

scroll.setup()
