require('formatter').setup({
  filetype = {
    markdown = {
      function()
	return {
	  exe = "prettier",
	  args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'  },
	  stdin = true
	}
      end
    },
    typescript= {
      function()
	return {
	  exe = "prettier",
	  args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'  },
	  stdin = true
	}
      end
    }
  }
})
