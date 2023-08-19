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

local installer_ok, installer = pcall(require, "nvim-lsp-installer")
if not installer_ok then
    print("LspInstaller not ready")
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

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities()) or {}


local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-b>", "<cmd>lua vim.lsp.buf.completion()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
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
    ]]   )
    end
end

local lsp_opts = {}

installer.on_server_ready(function(server)
    server:setup(lsp_opts[server.name] or {
        capabilities = capabilities,
        on_attach = on_attach
    })
end)

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
    underline = true,
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


lsp_opts["gopls"] = {
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
}

lsp_opts["sumneko_lua"] = {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
