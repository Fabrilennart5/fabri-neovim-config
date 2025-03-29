-- lua/lsp/init.lua

-- Configuración global de diagnósticos
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})

-- Mapeos de teclas consistentes al evento LspAttach
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- Ir a la definición
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- Mostrar información
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Renombrar
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Acciones de código
    end,
})
