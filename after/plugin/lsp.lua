-- Mason Setup
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls", "eslint", "lua_ls", "pylsp" },
    automatic_installation = true,
})

-- nvim-cmp setup
local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

cmp.setup({
    mapping = {
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Tab>"] = cmp.mapping.confirm({
            behaviour = cmp.ConfirmBehaviour.Replace,
            select = true
        }),
        ["<C-Space>"] = cmp.mapping.complete(),
    },
    sources = {
        { name = "nvim_lsp" },
    },
})

-- Capabilities for completion
local capabilities = cmp_lsp.default_capabilities()

-- Common on_attach function
local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end

-- LSP Server Configurations
local lspconfig = require("lspconfig")

-- Lua
lspconfig.lua_ls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- Python
lspconfig.pylsp.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        pylsp = {
            plugins = {
                flake8 = { enabled = true },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                pyflakes = { enabled = false },
            },
        },
    },
})

-- TypeScript
lspconfig.tsserver.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- ESLint
lspconfig.eslint.setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

-- Dart (manual setup)
lspconfig.dartls.setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/.pub-cache"),
                vim.fn.expand("$HOME/flutter/"),
            },
        },
    },
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
})

