local helpers = require("user.helpers")

require("oil").setup({
  columns = {
    "icon",
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, bufnr)
      return helpers.contains({ ".DS_Store" }, name)
    end,
  },
})

local r = require("user.remap").nnoremap

r("-", "<CMD>Oil<CR>")
