return {
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- Usar la última versión estable
    lazy = true, -- Cargar el plugin solo cuando sea necesario
    ft = "markdown", -- Activar solo para archivos Markdown
    dependencies = {
      "nvim-lua/plenary.nvim", -- Dependencia requerida
    },
    opts = {
      dir = "~/my-vault", -- Cambia esta ruta a donde quieras almacenar tus notas
      daily_notes = {
        folder = "daily", -- Carpeta para notas diarias
      },
      completion = {
        nvim_cmp = true, -- Activar integración con nvim-cmp
      },
    },
  },
}
