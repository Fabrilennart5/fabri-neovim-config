-- lua/plugins/format-on-save.lua

return {
  "elentok/format-on-save.nvim",  -- Especifica el plugin a instalar
  config = function()
    -- Importa el módulo format-on-save
    local format_on_save = require("format-on-save")
    -- Importa los formateadores disponibles
    local formatters = require("format-on-save.formatters")

    -- Configura el plugin format-on-save
    format_on_save.setup({
      -- Excluye ciertos directorios para evitar formatear archivos innecesarios
      exclude_path_patterns = {
        "/node_modules/",  -- Ignora archivos en node_modules
        ".local/share/nvim/lazy",  -- Ignora archivos en la carpeta de plugins lazy
      },

      -- Define los formateadores específicos para cada tipo de archivo
      formatter_by_ft = {
        -- Formatea archivos Java usando el LSP (Language Server Protocol)
        java = formatters.lsp,
        -- Formatea archivos Python usando Black (formateador popular para Python)
        python = formatters.black,
        -- Formatea archivos SQL usando el LSP
        sql = formatters.lsp,
      },

      -- Formateador de respaldo en caso de que no se encuentre un formateador específico
      fallback_formatter = {
        formatters.remove_trailing_whitespace,  -- Elimina espacios en blanco al final de las líneas
        formatters.remove_trailing_newlines,   -- Elimina líneas en blanco al final del archivo
      },

      -- Opcional: Desactiva el uso de "sh -c" para ejecutar comandos de shell
      run_with_sh = false,
    })
  end,
}
