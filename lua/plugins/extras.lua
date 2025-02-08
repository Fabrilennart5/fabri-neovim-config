-- Aquí van los plugins independientes con menos de 10 líneas de configuración
return {
  {
    -- Plugin para integración poderosa con Git
    'tpope/vim-fugitive',
  },
  {
    -- Plugin para integración de GitHub con vim-fugitive
    'tpope/vim-rhubarb',
  },
  {
    -- Plugin que muestra atajos de teclado disponibles
    'folke/which-key.nvim',
  },
  {
    -- Plugin que cierra automáticamente paréntesis, corchetes, comillas, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter', -- Se carga cuando entro en modo de inserción
    config = true,         -- Activar la configuración del plugin
    opts = {},            -- Opciones adicionales (vacías por ahora)
  },
  {
    -- Plugin que resalta comentarios como TODO, notas, etc.
    'folke/todo-comments.nvim',
    event = 'VimEnter',   -- Se carga al iniciar Vim
    dependencies = { 'nvim-lua/plenary.nvim' }, -- Necesita este plugin para funcionar
    opts = { signs = false }, -- No mostrar signos en los comentarios resaltados
  },
  {
    -- Plugin para resaltar colores de manera eficiente
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup() -- Configuración del plugin al iniciar
    end,
  },
}
