local r = require("user.remap").nnoremap

local files = require("mini.files")

files.setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.starter").setup()
require("mini.jump").setup()
require("mini.visits").setup()
require("mini.splitjoin").setup()
-- require("mini.git").setup()
local pick = require("mini.pick")
pick.setup({
  mappings = {
    choose_marked = "<C-q>",
  },
  source = {
    choose_marked = function(items)
      pick.default_choose_marked(items)
      pick.stop()
    end,
  }
})
require("mini.extra").setup()
require("mini.diff").setup()

function _G.open_mini_files()
  files.open(vim.api.nvim_buf_get_name(0))
  files.reveal_cwd()
end

r("<C-p>", "<CMD>lua open_mini_files()<CR>")
r("<leader>p", "<CMD>Pick files tool='rg'<CR>")
r("<leader>b", "<CMD>Pick buffers<CR>")
r("<leader>f", "<CMD>Pick grep_live tool='rg'<CR>")
r("<leader>dl", "<CMD>Pick diagnostic<CR>")

-- LSP picker does not add to jump list so for now, I'll use defaults
-- r("gr", "<CMD>Pick lsp scope='references'<CR>")
-- r("gd", "<CMD>Pick lsp scope='definition'<CR>")
-- r("gi", "<CMD>Pick lsp scope='implementation'<CR>")
-- r("gs", "<CMD>Pick lsp scope='document_symbol'<CR>")

r("<leader>ss", "<CMD>Pick spellsuggest<CR>")
r("<leader>t", "<CMD>Pick grep pattern='(TODO|FIXME|HACK|NOTE)'<CR>")
-- r("<CR>", "<CMD>lua MiniJump2d.start(MiniJump2d.builtin_opts.word_start)<CR>")
