-- Telescope es un buscador difuso para Neovim que permite buscar archivos, texto y más.
-- Ofrece una interfaz flexible para encontrar rápidamente información dentro de Neovim,
-- incluyendo búsqueda de archivos, búsqueda de texto en vivo, y acceso a ayuda y 
-- configuraciones. Es más que un simple "buscador de archivos"; puede buscar en 
-- muchos aspectos de tu espacio de trabajo, LSP y más.

return {
  'nvim-telescope/telescope.nvim', -- Plugin Telescope para búsqueda difusa en Neovim
  event = 'VimEnter', -- Cargar el plugin al iniciar Neovim
  branch = '0.1.x', -- Usar la rama 0.1.x del plugin
  dependencies = {
    'nvim-lua/plenary.nvim', -- Dependencia necesaria para funcionalidades de Telescope
    { -- Si hay errores, consulta la README de telescope-fzf-native para instrucciones de instalación
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` se usa para ejecutar un comando cuando el plugin es instalado o actualizado.
      build = 'make', -- Comando para compilar la extensión

      -- `cond` determina si este plugin debe ser instalado y cargado.
      cond = function()
        return vim.fn.executable 'make' == 1 -- Verifica si 'make' está disponible
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' }, -- Extensión para selección de UI

    -- Útil para obtener íconos bonitos, requiere una fuente Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font }, -- Habilitar íconos si se tiene la fuente
  },
  config = function()
    require('telescope').setup {
      defaults = { -- Configuración por defecto de Telescope
        mappings = {
          i = { -- Mapeos en modo Insert
            ['<C-k>'] = require('telescope.actions').move_selection_previous, -- Mover a resultado anterior
            ['<C-j>'] = require('telescope.actions').move_selection_next, -- Mover al siguiente resultado
            ['<C-l>'] = require('telescope.actions').select_default, -- Abrir archivo seleccionado
          },
        },
      },
      pickers = {
        find_files = { 
          file_ignore_patterns = { 'node_modules', '.git', '.venv' }, -- Ignorar estos patrones al buscar archivos
          hidden = true, -- Mostrar archivos ocultos al buscar archivos
        },
      },
      live_grep = {
        file_ignore_patterns = { 'node_modules', '.git', '.venv' }, -- Ignorar estos patrones al hacer grep en vivo
        additional_args = function(_)
          return { '--hidden' } -- Permitir búsqueda en archivos ocultos
        end,
      },
      extensions = {
        ['ui-select'] = { 
          require('telescope.themes').get_dropdown(), -- Configuración del tema para la extensión ui-select
        },
      },
    }

    -- Habilitar extensiones de Telescope si están instaladas
    pcall(require('telescope').load_extension, 'fzf') -- Cargar la extensión fzf si está disponible
    pcall(require('telescope').load_extension, 'ui-select') -- Cargar la extensión ui-select si está disponible

    local builtin = require 'telescope.builtin' 
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' }) 
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' }) 
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' }) 
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' }) 
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' }) 
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' }) 
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' }) 
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' }) 
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' }) 
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' }) 

    -- Ejemplo avanzado de sobrescribir comportamiento predeterminado y tema
    vim.keymap.set('n', '<leader>/', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Búsqueda difusa en el buffer actual' })

    -- También es posible pasar opciones adicionales de configuración.
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = '[S]earch [/] in Open Files' })
  end,
}
