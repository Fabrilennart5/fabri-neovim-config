return { -- Autocompletion
  'hrsh7th/nvim-cmp', -- Plugin principal para autocompletado
  dependencies = {
    -- Motor de Snippets y su fuente asociada para nvim-cmp
    {
      'L3MON4D3/LuaSnip', -- Plugin de LuaSnip, motor de snippets
      build = (function()
        -- Este paso de construcción es necesario para habilitar el soporte de expresiones regulares en snippets.
        -- Este paso no se soporta en muchos entornos de Windows.
        -- Si estás en Windows, elimina esta condición para habilitarlo de nuevo.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp' -- Comando de construcción si no estás en Windows
      end)(),
      dependencies = {
        -- `friendly-snippets` contiene una variedad de snippets predefinidos.
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load() -- Cargar snippets de VSCode
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip', -- Complemento para integrar LuaSnip con nvim-cmp

    -- Fuentes adicionales para el autocompletado
    'hrsh7th/cmp-nvim-lsp', -- Completar con LSP
    'hrsh7th/cmp-buffer', -- Completar desde el buffer actual
    'hrsh7th/cmp-path', -- Completar desde las rutas de archivos
  },
  config = function()
    -- Configuración de nvim-cmp
    local cmp = require 'cmp' -- Cargar el módulo cmp
    local luasnip = require 'luasnip' -- Cargar el módulo LuaSnip
    luasnip.config.setup {} -- Configurar LuaSnip

    -- Iconos para cada tipo de completado
    local kind_icons = {
      Text = '󰉿', -- Texto
      Method = 'm', -- Método
      Function = '󰊕', -- Función
      Constructor = '', -- Constructor
      Field = '', -- Campo
      Variable = '󰆧', -- Variable
      Class = '󰌗', -- Clase
      Interface = '', -- Interfaz
      Module = '', -- Módulo
      Property = '', -- Propiedad
      Unit = '', -- Unidad
      Value = '󰎠', -- Valor
      Enum = '', -- Enumeración
      Keyword = '󰌋', -- Palabra clave
      Snippet = '', -- Fragmento de código
      Color = '󰏘', -- Color
      File = '󰈙', -- Archivo
      Reference = '', -- Referencia
      Folder = '󰉋', -- Carpeta
      EnumMember = '', -- Miembro de enumeración
      Constant = '󰇽', -- Constante
      Struct = '', -- Estructura
      Event = '', -- Evento
      Operator = '󰆕', -- Operador
      TypeParameter = '󰊄', -- Parámetro de tipo
    }

    -- Configuración de nvim-cmp
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Expande los snippets usando LuaSnip
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' }, -- Opciones de completado

      -- Mapeo de teclas para la interacción con el autocompletado
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(), -- Seleccionar el siguiente ítem
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- Seleccionar el ítem anterior
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Desplazar la ventana de documentación hacia atrás
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- Desplazar la ventana de documentación hacia adelante
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Aceptar el autocompletado
        ['<C-Space>'] = cmp.mapping.complete {}, -- Activar manualmente el autocompletado
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump() -- Expandir o saltar dentro de un snippet
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1) -- Saltar a la ubicación anterior dentro de un snippet
          end
        end, { 'i', 's' }),

        -- Mapas avanzados de teclas para LuaSnip
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Seleccionar el siguiente ítem si hay completado visible
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump() -- Expandir o saltar dentro de un snippet
          else
            fallback() -- Volver al comportamiento por defecto si no hay opciones
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Seleccionar el ítem anterior si hay completado visible
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1) -- Saltar a la ubicación anterior dentro de un snippet
          else
            fallback() -- Volver al comportamiento por defecto si no hay opciones
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'lazydev', group_index = 0 }, -- Fuente de LazyDev
        { name = 'nvim_lsp' }, -- Fuente del LSP (Language Server Protocol)
        { name = 'luasnip' }, -- Fuente de LuaSnip
        { name = 'buffer' }, -- Fuente del buffer actual
        { name = 'path' }, -- Fuente de rutas de archivos
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' }, -- Definir los campos a mostrar en el autocompletado
        format = function(entry, vim_item)
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind]) -- Asignar el icono correspondiente al tipo
          vim_item.menu = ({
            nvim_lsp = '[LSP]', -- Etiqueta para LSP
            luasnip = '[Snippet]', -- Etiqueta para Snippets
            buffer = '[Buffer]', -- Etiqueta para Buffer
            path = '[Path]', -- Etiqueta para Path
          })[entry.source.name] -- Asignar una etiqueta según la fuente
          return vim_item
        end,
      },
    }
  end,
}
