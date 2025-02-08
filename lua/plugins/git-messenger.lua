return {
  'rhysd/git-messenger.vim', -- Este es el plugin que me permite ver mensajes de commits de Git bajo el cursor.
  
  -- Dependencias necesarias para el correcto funcionamiento del plugin
  dependencies = { 
    'nvim-lua/plenary.nvim', -- Esta es una biblioteca de utilidades Lua que el plugin necesita.
  },

  config = function()
    -- Aquí puedo añadir configuraciones adicionales si lo deseo.
    -- Por ejemplo, puedo establecer mapeos de teclas personalizados o ajustar opciones del popup.
    
    -- Mapeo por defecto para ejecutar el comando del plugin
    vim.api.nvim_set_keymap('n', '<Leader>gm', ':GitMessenger<CR>', { noremap = true, silent = true })
    -- Esto me permite abrir la ventana emergente con el mensaje del commit usando <Leader>gm.
    
    -- Puedo configurar otras opciones aquí si es necesario.
    -- Por ejemplo, para cerrar la ventana emergente al mover el cursor:
    vim.g.git_messenger_close_on_cursor_moved = true
  end,
}
