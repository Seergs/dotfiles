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

local garbage_ok, garbage = pcall(require, "garbage-day")
if not garbage_ok then
  print("garbage not ready")
  return
end

local dap = require("dap")

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
    "github:nvim-java/mason-registry",
    "github:mason-org/mason-registry",
  }
})

local servers = {
  "ts_ls",
  "html",
  "lua_ls",
  "bashls",
  "dockerls",
  "gopls",
  "jsonls",
  "yamlls",
  "jdtls"
}

for _, server in ipairs(servers) do
    vim.lsp.enable(server)
end

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
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
})


vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("i", "<C-b>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>gs", vim.lsp.buf.document_symbol, opts)
        vim.keymap.set("n", "<leader>dn", function()
        vim.diagnostic.goto_next({ border = "rounded" })
        end, opts)
        vim.keymap.set("n", "<leader>dp", function()
          vim.diagnostic.goto_prev({ border = "rounded" })
        end, opts)
        vim.keymap.set("n", "<C-f>", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        vim.keymap.set("n", "gl", function()
          vim.diagnostic.open_float({ border = "rounded" })
        end, opts)
    end
})


-- require("java").setup()

garbage.setup({
    notifications  = true
})
