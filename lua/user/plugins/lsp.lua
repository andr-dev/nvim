-- Capabilities (shared across all servers)
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("cmp_nvim_lsp").default_capabilities()
)

-- LSP keymaps (global, applied on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }
    local buf = vim.lsp.buf

    vim.keymap.set("n", "lf", function()
      buf.format({ async = true })
    end, opts)

    vim.keymap.set("n", "K", buf.hover, opts)
    vim.keymap.set("n", "ga", buf.code_action, opts)
    vim.keymap.set("n", "gd", buf.definition, opts)
    vim.keymap.set("n", "gD", buf.declaration, opts)
    vim.keymap.set("n", "gi", buf.implementation, opts)
    vim.keymap.set("n", "go", buf.type_definition, opts)
    vim.keymap.set("n", "gr", buf.references, opts)
    vim.keymap.set("n", "gR", buf.rename, opts)
    vim.keymap.set("n", "gs", buf.signature_help, opts)

    vim.keymap.set("n", "gS", "<cmd>Telescope diagnostics<CR>", opts)
  end,
})

-- Server configs
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  capabilities = capabilities,
})

-- Enable all servers
vim.lsp.enable({
  "lua_ls",
  "rust_analyzer",
})

-- nvim-cmp setup
local cmp = require("cmp")

cmp.setup({
  sources = {
    { name = "nvim_lsp" },
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sorting = {
    comparators = {
      cmp.config.compare.order,
    },
  },
})
