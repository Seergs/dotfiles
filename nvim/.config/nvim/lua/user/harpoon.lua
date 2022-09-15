local r = require("user.remap").nnoremap

r("<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>")
r("<C-e>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
r("<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>")
r("<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>")
r("<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>")
r("<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>")
