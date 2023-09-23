local ok, telescope = pcall(require, "telescope")
if not ok then
  print("Telescope not ready")
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    file_ignore_patterns={"node_modules", ".git",  "dist"},
    prompt_prefix = "",
    mappings = {
      i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
      }
    },
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
      theme="dropdown",
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
r("<leader>g", ":Telescope grep_string<cr>")
r("<leader>b", ":Telescope buffers<cr>")
r("gr", ":Telescope lsp_references<cr>")
r("gi" ,":Telescope lsp_implementations<cr>")
r("<leader>dl", ":Telescope diagnostics<cr>")
r("gd", ":Telescope lsp_definitions<cr>")
