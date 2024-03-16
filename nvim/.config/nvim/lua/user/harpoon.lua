local r = require("user.remap").nnoremap

_G.harpoon_and_notify = function()
  require("harpoon.mark").add_file()
  print("Marked")
end

r("<leader>a", "<cmd>lua harpoon_and_notify()<CR>")
r("<leader>e", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
r("<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
r("<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
r("<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
r("<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
