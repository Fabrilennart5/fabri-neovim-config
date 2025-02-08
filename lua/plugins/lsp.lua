return {
  -- Configuración principal del LSP
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Instalación automática de LSPs y herramientas relacionadas en el path estándar de Neovim
    { 'williamboman/mason.nvim', config = true }, -- Mason es un gestor de paquetes para LSPs, formateadores, linters, etc.
    'williamboman/mason-lspconfig.nvim', -- Integración entre Mason y lspconfig para configurar LSPs automáticamente.
    'WhoIsSethDaniel/mason-tool-installer.nvim', -- Instala automáticamente herramientas como formateadores y linters.

    -- Actualizaciones útiles para el estado del LSP.
    -- Muestra el progreso de las operaciones del LSP en la esquina inferior derecha.
    { 'j-hui/fidget.nvim', opts = {} },

    -- Permite capacidades adicionales proporcionadas por nvim-cmp (autocompletado).
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp', -- Plugin principal de autocompletado.
    'L3MON4D3/LuaSnip', -- Motor de snippets (necesario para nvim-cmp).
    'saadparwaiz1/cmp_luasnip', -- Integración de snippets con nvim-cmp.
    'hrsh7th/cmp-buffer', -- Autocompletado basado en el contenido del buffer.
    'hrsh7th/cmp-path', -- Autocompletado para rutas de archivos.
  },
  config = function()
    -- Configuración de nvim-cmp (autocompletado).
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Usa LuaSnip para expandir snippets.
        end,
      },
      mapping = {
        -- Seleccionar la opción actual con Enter.
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter selecciona la opción actual.
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item() -- Navegar a la siguiente opción con Tab.
          else
            fallback() -- Comportamiento por defecto de Tab.
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item() -- Navegar a la opción anterior con Shift+Tab.
          else
            fallback() -- Comportamiento por defecto de Shift+Tab.
          end
        end, { 'i', 's' }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' }, -- Fuente de autocompletado del LSP.
        { name = 'luasnip' }, -- Fuente de snippets.
        { name = 'buffer' }, -- Fuente de autocompletado basado en el buffer.
        { name = 'path' }, -- Fuente de autocompletado para rutas de archivos.
      }),
    })

    -- Función que se ejecuta cuando un LSP se adjunta a un buffer (archivo abierto).
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- Función que facilita la creación de mapeos de teclas específicos para LSP.
        local map = function(keys, func, desc, mode)
          mode = mode or 'n' -- Modo normal por defecto.
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- Mapeo para ir a la definición del símbolo bajo el cursor.
        -- Presiona `gd` para ir a la definición del símbolo.
        map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Mapeo para encontrar las referencias del símbolo bajo el cursor.
        -- Presiona `gr` para ver todas las referencias del símbolo.
        map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Mapeo para renombrar la variable bajo el cursor.
        -- Presiona `<leader>rn` (normalmente `<Space>rn`) para renombrar la variable.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Mapeo para ejecutar una acción de código (como arreglar un error o refactorizar).
        -- Presiona `<leader>ca` (normalmente `<Space>ca`) para ver las acciones disponibles.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

        -- Mapeo para ir a la declaración del símbolo bajo el cursor.
        -- Presiona `gD` para ir a la declaración del símbolo.
        map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      end,
    })

    -- Capacidades adicionales de LSP proporcionadas por nvim-cmp (autocompletado).
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

    -- LSPs que se habilitarán.
    local servers = {
      -- LSP para Java (jdtls).
      jdtls = {},
      -- LSP para Python (ruff).
      ruff = {},
      -- LSP para Rust (rust_analyzer).
      rust_analyzer = {},
      -- LSP para SQL (sqlls).
      sqlls = {},
    }

    -- Asegurar que los LSPs mencionados estén instalados.
    require('mason').setup()

    -- Instalar herramientas adicionales si es necesario.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Formateador para Lua.
      'black',  -- Formateador para Python.
      'rustfmt', -- Formateador para Rust.
      'prettier', -- Formateador para JavaScript, TypeScript, CSS, etc.
      'sqlfmt', -- Formateador para SQL.
      'google-java-format', -- Formateador para Java (sigue el estilo de Google).
      'checkstyle', -- Herramienta de análisis de código para Java (verifica el estilo y calidad del código).
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    -- Configurar los LSPs.
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- Configuración de capacidades para el LSP.
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
