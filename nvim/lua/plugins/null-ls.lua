return {
	'nvimtools/none-ls.nvim',
	ft = "go",
		opts = function()
	    return require "plugins.configs.null-ls"
	end,
}
