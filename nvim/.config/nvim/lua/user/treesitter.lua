local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
  print("Treesitter not ready")
  return
end

treesitter.setup({
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
  },
incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = false
  }
})
