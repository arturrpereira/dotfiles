return {
  "sindrets/diffview.nvim",
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,  -- Ativa realce melhorado para mostrar mudanças dentro da linha
    })
  end
}
