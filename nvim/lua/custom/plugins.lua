local plugins = {
	{
		'neovim/nvim-lspconfig',
		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls",
			},
		},
	},
}
return plugins
