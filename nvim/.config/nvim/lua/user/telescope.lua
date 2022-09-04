local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope not ready")
  return
end

telescope.setup({
  defaults = {
    prompt_prefix = "",
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    path_display = {"truncate"},
  },
  pickers = {
    find_files = {
      hidden = true,
      theme="dropdown"
    },
    live_grep = {
      theme="dropdown"
    },
    lsp_references = {
      theme = "dropdown"
    },
    lsp_implementations = {
      theme = "dropdown"
    }
  }
})

telescope.load_extension "file_browser"

local r = require("user.remap").nnoremap

r("<leader>p", ":Telescope find_files<cr>")
r("<leader>f" , ":Telescope live_grep<cr>")
r("<leader>b", ":Telescope buffers<cr>")
r("gr", ":Telescope lsp_references<cr>")
r("gi" ,":Telescope lsp_implementations<cr>")
r("<leader>dl", ":Telescope diagnostics<cr>")
r("gd", ":Telescope lsp_definitions<cr>")
