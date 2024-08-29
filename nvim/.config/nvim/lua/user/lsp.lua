local config_ok, lspconfig = pcall(require, 'lspconfig')
if not config_ok then
  print("LspConfig not ready")
  return
end

local signature_ok, signature = pcall(require, "lsp_signature")
if not signature_ok then
  print("LspSignature not ready")
  return
end

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  print("Mason not ready")
  return
end

local mason_config_ok, mason_config = pcall(require, "mason-lspconfig")
if not mason_config_ok then
  print("Mason lsp config not ready")
  return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  print("cmp_nvim_lsp not ready")
  return
end


signature.setup({
  floating_window = false,
  hint_prefix = "",
  bind = true,
  handler_opts = {
    border = "rounded"
  }
})

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  registries = {
    -- "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry",
  }
})

mason_config.setup({
  ensure_installed = {
    "tsserver",
    "html",
    "lua_ls",
    "bashls",
    "dockerls",
    "gopls",
    "jsonls",
    "yamlls",
    "jdtls"
  },
  automatic_installation = true
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-b>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-b>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dn", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>'
    ,
    opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>dp", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>'
    ,
    opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-f>", '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
    opts
  )

  if client.resolved_capabilities.document_highlight then
    vim.cmd([[
      augroup lsp_document_highlight
              autocmd! * <buffer>
              autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
              autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
end

local lsp_opts = {
  gopls = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
    flags = {
      debounce_text_changes = 150,
    },
  },
  lua_ls = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' }
        }
      }
    }
  },
  jdtls = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150
    },
    settings = {
      java = {
        format = {
          settings = {
            url = "https://raw.githubusercontent.com/redhat-developer/vscode-java/master/formatters/eclipse-formatter.xml",
            profile = "GoogleStyle",
            -- You can customize the formatter settings here
            settings = {
              tabSize = 4,
              indentSize = 4,
              continuationIndentSize = 4,
              insertSpaces = true,
            }
          },
        },
        -- configuration = {
        --   runtimes = {
        --     {
        --       name = "JavaSE-1.8",
        --       path = "/Library/Java/JavaVirtualMachines/jdk1.8.0_311.jdk"
        --     }
        --   }
        -- },
      }
    }
  }
}

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- require("java").setup()

mason_config.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup(lsp_opts[server_name] or {
      capabilities = capabilities,
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    })
  end
})


-- require('lspconfig').jdtls.setup(lsp_opts.jdtls or {
--   capabilities = capabilities,
--   on_attach = on_attach,
--   flags = {
--     debounce_text_changes = 150,
--   },
-- })
