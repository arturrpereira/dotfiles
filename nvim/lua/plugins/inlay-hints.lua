return {
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            -- Configuração do plugin inlay-hints
            require("inlay-hints").setup()
        end,
    }
}
