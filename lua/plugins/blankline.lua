return {
  -- Este es el plugin que uso para mostrar líneas de indentación
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl', -- Indico que el módulo principal del plugin es 'ibl'
  
  opts = {
    -- Opciones de configuración del plugin
    indent = {
      char = '▏', -- Este es el carácter que se usará para mostrar la indentación
    },
    
    scope = {
      show_start = false, -- No quiero mostrar el inicio del alcance
      show_end = false,   -- No quiero mostrar el final del alcance
      show_exact_scope = false, -- No muestro el alcance exacto
    },
    
    exclude = {
      filetypes = {
        -- Aquí excluyo ciertos tipos de archivos para que no muestren líneas de indentación
        'help',          -- No quiero líneas en la ayuda de Neovim
        'startify',     -- No quiero líneas en la pantalla de inicio
        'dashboard',     -- No quiero líneas en el dashboard de Neovim
        'packer',        -- No quiero líneas en la configuración de Packer
        'neogitstatus',  -- No quiero líneas en el estado de Neogit
        'NvimTree',      -- No quiero líneas en el explorador de archivos NvimTree
        'Trouble',       -- No quiero líneas en el plugin Trouble para mostrar errores
      },
    },
  },
}
