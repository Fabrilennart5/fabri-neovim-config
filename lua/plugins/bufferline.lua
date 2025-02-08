return {
  'akinsho/bufferline.nvim', -- Carga el plugin Bufferline
  dependencies = { -- Dependencias necesarias para el funcionamiento del plugin
    'moll/vim-bbye', -- Permite cerrar buffers sin problemas
    'nvim-tree/nvim-web-devicons', -- Proporciona íconos para una mejor visualización
  },
  config = function() -- Configuración del plugin
    require('bufferline').setup { -- Inicializa Bufferline con opciones personalizadas
      options = {
        mode = 'buffers', -- Modo de visualización, puede ser "tabs" o "buffers"
        themable = true, -- Permite personalizar los colores del tema
        numbers = 'none', -- Muestra los números de los buffers (opciones: "ordinal", "buffer_id", "both")
        close_command = 'Bdelete! %d', -- Comando para cerrar un buffer
        buffer_close_icon = '✗', -- Ícono para cerrar el buffer
        close_icon = '✗', -- Ícono para cerrar
        path_components = 1, -- Muestra solo el nombre del archivo sin la ruta
        modified_icon = '●', -- Ícono que indica si el buffer ha sido modificado
        left_trunc_marker = '', -- Marcador para truncar a la izquierda
        right_trunc_marker = '', -- Marcador para truncar a la derecha
        max_name_length = 30, -- Longitud máxima del nombre del buffer
        max_prefix_length = 30, -- Longitud máxima del prefijo al desduplicar buffers
        tab_size = 21, -- Tamaño de las pestañas
        diagnostics = false, -- Desactiva diagnósticos en los buffers
        diagnostics_update_in_insert = false, -- No actualiza diagnósticos en modo de inserción
        color_icons = true, -- Activa íconos de colores para los buffers
        show_buffer_icons = true, -- Muestra íconos en los buffers
        show_buffer_close_icons = true, -- Muestra íconos para cerrar buffers
        show_close_icon = true, -- Muestra ícono de cerrar en la línea de buffers
        persist_buffer_sort = true, -- Mantiene el orden personalizado de los buffers
        separator_style = { '│', '│' }, -- Estilo del separador entre buffers
        enforce_regular_tabs = true, -- Asegura que todas las pestañas sean regulares
        always_show_bufferline = true, -- Siempre muestra la línea de buffers
        show_tab_indicators = false, -- No muestra indicadores en las pestañas
        indicator = { 
          style = 'none', -- Estilo del indicador (puede ser 'icon', 'underline', o 'none')
        },
        icon_pinned = '󰐃', -- Ícono para buffers fijados
        minimum_padding = 1, 
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = 'insert_at_end', -- Ordena los buffers por su inserción al final
      },
      highlights = { 
        separator = {
          fg = '#434C5E', -- Color del separador entre buffers
        },
        buffer_selected = {
          bold = true, -- Estilo en negrita para el buffer seleccionado
          italic = false,
        },
      },
    }
  end,
}
