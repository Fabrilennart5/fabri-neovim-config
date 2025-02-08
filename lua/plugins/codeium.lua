return {
    "Exafunction/codeium.vim", -- Nombre correcto del plugin
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        -- Configuración de Codeium
        vim.g.codeium_enabled = true -- Habilita Codeium por defecto

        -- Configuración de nvim-cmp (opcional pero recomendado)
        local cmp = require("cmp")
        cmp.setup({
            sources = {
                { name = "codeium" }, -- Añade Codeium como fuente de autocompletado
                { name = "nvim_lsp" }, -- Otras fuentes de autocompletado
                { name = "buffer" },
                { name = "path" },
            },
        })
    end
}
