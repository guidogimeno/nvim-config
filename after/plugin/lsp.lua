local lsp = require("lsp-zero")
local cmp = require("cmp")

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end)
	vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end)
	vim.keymap.set("n", "vca", function() vim.lsp.buf.code_action() end)
	vim.keymap.set("n", "vrn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
end)

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = {
	"gopls",
	"eslint",
	"tsserver",
	"html",
	"jsonls",
  },
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
          capabilities = lsp_capabilities
      })
    end,
  }
})

vim.diagnostic.config({
  signs = false,
  virtual_text = true,
})

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({behavior = "select"}),
        ["<C-n>"] = cmp.mapping.select_next_item({behavior = "select"}),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = nil,
        ["<S-Tab>"] = nil
    })
})

