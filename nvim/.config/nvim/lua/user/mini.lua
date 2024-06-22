local r = require("user.remap").nnoremap

local files = require("mini.files")

files.setup()
require("mini.ai").setup()
require("mini.surround").setup()
require("mini.starter").setup()
require("mini.jump").setup()
require("mini.visits").setup()
require("mini.pick").setup()
require("mini.extra").setup()

require("mini.diff").setup()
-- require("mini.jump2d").setup()

function _G.open_mini_files()
  files.open(vim.api.nvim_buf_get_name(0))
  files.reveal_cwd()
end

-- r("<C-p>", "<CMD>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>")
r("<C-p>", "<CMD>lua open_mini_files()<CR>")
r("<leader>p", "<CMD>Pick files tool='git'<CR>")
r("<leader>b", "<CMD>Pick buffers<CR>")
r("<leader>f", "<CMD>Pick grep_live tool='git'<CR>")
r("<leader>dl", "<CMD>Pick diagnostic<CR>")
r("gr", "<CMD>Pick lsp scope='references'<CR>")
r("gd", "<CMD>Pick lsp scope='definition'<CR>")
r("gi", "<CMD>Pick lsp scope='implementation'<CR>")
r("gs", "<CMD>Pick lsp scope='document_symbol'<CR>")
r("<leader>ss", "<CMD>Pick spellsuggest<CR>")
r("<leader>t", "<CMD>Pick grep pattern='(TODO|FIXME|HACK|NOTE)'<CR>")
