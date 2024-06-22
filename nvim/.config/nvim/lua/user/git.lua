require('git-worktree').setup()
require('telescope').load_extension('git_worktree')
require("octo").setup()
require("gitpad").setup()
-- require("gitsigns").setup()

local r = require("user.remap").nnoremap

r("<leader>t", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
r("<leader>T", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")


