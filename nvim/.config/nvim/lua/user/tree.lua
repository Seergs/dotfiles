local ok, tree = pcall(require, "nvim-tree")
if not ok then
  print("Tree not ready")
  return
end

tree.setup({
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

