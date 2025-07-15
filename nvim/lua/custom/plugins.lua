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
	{
	  'jose-elias-alvarez/null-ls.nvim',
	  ft = "go",
	  opts = function()
	    return require "custom.configs.null-ls"
	  end,
	},
}
return plugins
