return {
  'stevearc/oil.nvim',  -- Este es el plugin Oil para gestionar archivos en Neovim.

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},  -- Aquí se pueden definir opciones de configuración, pero por ahora lo dejo vacío.

  -- Dependencias opcionales  
  dependencies = { { "echasnovski/mini.icons", opts = {} } },  
  -- Estoy usando "mini.icons" para los íconos, pero podría cambiarlo más adelante.  

  -- Si prefiero usar "nvim-web-devicons" en su lugar, puedo descomentar la siguiente línea:
  -- dependencies = { "nvim-tree/nvim-web-devicons" },  

  -- No voy a cargarlo de forma diferida (lazy) porque puede generar problemas en algunos casos.
  lazy = false,

  -- Permite navegar al directorio padre de un archivo con la tecla '-'.
  -- Esto me facilita la navegación rápida entre directorios.
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Abrir el directorio padre" })
}

