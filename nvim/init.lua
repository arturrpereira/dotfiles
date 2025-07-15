require("config.lazy")

vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.hlsearch = false

-- telescope binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fmp', ":silent !black %<cr>")
vim.keymap.set('n', '<leader>o', ':only<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<A-Right>", "<C-w>>", { noremap = true })
vim.keymap.set("n", "<A-Left>", "<C-w><", { noremap = true })
vim.keymap.set("n", "<leader>sh", ":split<CR>", { noremap = true })
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", { noremap = true })
vim.keymap.set("n", "<leader>os", ":Telescope find_files search_dirs={'/home/artur/obsidian/'}<cr>")
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>")
vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<cr>")
vim.keymap.set("n", "<leader>fmg", ":!gofmt -s -w %<CR>:e!<CR>", { desc = "Formatar arquivo Go com gofmt" })

vim.opt.termguicolors = true

-- DiffView
-- vim.keymap.set('n', '<leader>gd', ":DiffviewOpen<CR>", {silent = true})
-- vim.keymap.set('n', '<leader>q', ":DiffviewClose<CR>", {silent = true})
vim.cmd.colorscheme "dracula"
-- vim.api.nvim_set_hl(0, 'DiffChange', { bg = "#3f473c"})
-- vim.api.nvim_set_hl(0, 'DiffText', { bg = "#415e44"})
--
vim.o.background = "dark"

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'




-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
--

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}
	local client_id = event.data.client_id
	local client = vim.lsp.get_client_by_id(client_id)

	client.config = vim.tbl_deep_extend('force', client.config, {
				settings = {

			}
		})

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

  end,
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system

-- require('lspconfig').gleam.setup({})
-- require('lspconfig').rust_analyzer.setup({})
--
--
--
require('lspconfig').lua_ls.setup({})
require('lspconfig').pyright.setup({})

local cmp = require('cmp')
local luasnip = require("luasnip")

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  	{ name = "luasnip" }, -- fonte de snippets
    { name = "buffer" },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
			luasnip.lsp_expand(args.body)
    end,
  },
	mapping = cmp.mapping.preset.insert({
  	['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
})

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
	highlight_git = true,
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
		enable = true,
	}
})

vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

require("lspconfig").gopls.setup({
  on_attach = function(client, bufnr)
        -- Ativa os inlay hints assim que o LSP for anexado
     client.server_capabilities.inlayHintProvider = true
  end,
  -- Outras configurações do gopls (se houver)
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
