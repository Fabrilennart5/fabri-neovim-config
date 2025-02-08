-- Este plugin añade indicadores relacionados con Git en el margen izquierdo del editor.
-- También proporciona utilidades para gestionar cambios en los archivos.
return {
  'lewis6991/gitsigns.nvim', -- Nombre del plugin
  opts = {
    signs = { -- Configuración de los indicadores
      add = { text = '+' }, -- Indicador para líneas añadidas
      change = { text = '~' }, -- Indicador para líneas modificadas
      delete = { text = '_' }, -- Indicador para líneas eliminadas
      topdelete = { text = '‾' }, -- Indicador para líneas eliminadas al principio del archivo
      changedelete = { text = '~' }, -- Indicador para líneas que han sido modificadas y luego eliminadas
    },
    signs_staged = { -- Configuración de indicadores para cambios en el área de preparación (staging)
      add = { text = '+' }, -- Indicador para líneas añadidas en staging
      change = { text = '~' }, -- Indicador para líneas modificadas en staging
      delete = { text = '_' }, -- Indicador para líneas eliminadas en staging
      topdelete = { text = '‾' }, -- Indicador para líneas eliminadas al principio en staging
      changedelete = { text = '~' }, -- Indicador para líneas que han sido modificadas y luego eliminadas en staging
    },
  },
}
