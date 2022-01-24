Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

augroup markdownSpell
  autocmd!
  autocmd FileType markdown,latex,tex set spell
augroup END
