local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
-- local on_attach = function(client, bufnr)
--   require("inlay-hints").on_attach(client, bufnr)
-- end

local capabilities = config.capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {"python"}
})

-- lspconfig.gopls.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = {"gopls"},
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- })
