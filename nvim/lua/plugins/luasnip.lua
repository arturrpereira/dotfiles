return {
	"L3MON4D3/LuaSnip",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- carrega snippets estilo vscode, se quiser
  end,
}
