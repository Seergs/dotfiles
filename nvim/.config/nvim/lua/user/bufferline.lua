local ok, bufline = pcall(require, "bufferline")
if not ok then
  print("Bufferline not ready")
  return
end

bufline.setup()
