return{
    -- Agregamos el plugin `transparent.nvim` para hacer Neovim transparente
    "xiyaowong/transparent.nvim", 
    priority = 1000, -- Establecemos una alta prioridad para asegurar que se cargue correctamente
    config = true, -- Indica que se debe ejecutar la configuración del plugin al cargar
    opts = { 
      extra_groups = { "NormalFloat", "NvimTreeNormal" }, -- Grupos adicionales a los que se aplicará la transparencia
      exclude_groups = {}, -- Grupos que no queremos hacer transparentes (puedes agregar aquí si es necesario)
    }
  }
