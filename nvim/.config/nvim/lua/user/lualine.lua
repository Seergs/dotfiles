local ok, lualine = pcall(require, "lualine")
if not ok then
  print("Lualine not ready")
  return
end

lualine.setup({
  options = {
    theme = "auto",
    component_separators = "",
    section_separators = "",
    alway_divide_middle = true,
  },
  sections = {
    lualine_b = {
      'branch'
    },
    lualine_c = {
      {
        "filename",
        file_status = false,
        path = 1
      }
    },
    lualine_x = {
      'filetype'
    }
  }
})
