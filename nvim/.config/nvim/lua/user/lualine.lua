local ok, lualine = pcall(require, "lualine")
if not ok then
  print("Lualine not ready")
  return
end

lualine.setup({
  options = {
    theme = "catppuccin",
    component_separators = "",
    section_separators = ""
  },
  sections = {
    lualine_c = {
      {
        "filetype",
        icon_only = true,
      },
      {
        "filename",
        file_status = false,
        path = 1
      }
    },
  }
})
