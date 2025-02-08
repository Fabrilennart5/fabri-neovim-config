return {
  'goolord/alpha-nvim', -- Nombre del plugin que se va a utilizar
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- Dependencia necesaria para iconos en la interfaz
  },

  config = function()
    local alpha = require 'alpha' -- Carga el módulo 'alpha'
    local dashboard = require 'alpha.themes.startify' -- Carga el tema de inicio 'startify'

    -- Aquí se define el encabezado que se mostrará en la pantalla de inicio
    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    -- Centra el encabezado en la pantalla
    dashboard.section.header.opts = {
      position = "center", -- Establece la posición a "center"
    }

    -- Configura el dashboard con las opciones definidas
    alpha.setup(dashboard.opts)
  end,
}
