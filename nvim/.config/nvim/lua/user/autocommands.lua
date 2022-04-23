vim.cmd([[
augroup markdownSpell
  autocmd!
  autocmd FileType markdown,latex,tex set spell
augroup END
]])
