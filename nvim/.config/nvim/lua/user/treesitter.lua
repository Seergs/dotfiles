local ok, treesitter = pcall(require, "nvim-treesitter.configs")
local ok_context, treesitter_context = pcall(require, "treesitter-context")

if not ok then
  print("Treesitter not ready")
  return
end

if not ok_context then
  print("Treesitter context not ready")
  return
end

treesitter.setup({
  ensure_installed = "all",
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

treesitter_context.setup()
