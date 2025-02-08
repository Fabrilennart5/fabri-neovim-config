return {
  -- Cargar el plugin 'barbar.nvim' para una mejor gestión de pestañas en Neovim
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- Opcional: para mostrar el estado de Git en las pestañas
      'nvim-tree/nvim-web-devicons', -- Opcional: para mostrar iconos de archivos en las pestañas
    },
    init = function()
      -- Desactivar la configuración automática de barbar.nvim (LazyVim lo hará por ti)
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- Ejemplos de opciones:
      animation = true,  -- Habilitar animaciones al cambiar de pestaña
      -- insert_at_start = true,  -- Insertar nuevas pestañas al inicio
      -- ...etc.
    },
    version = '^1.0.0', -- Opcional: solo actualizar cuando se lance una nueva versión 1.x
  },
}
