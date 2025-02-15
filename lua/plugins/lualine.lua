-- Este plugin, Lualine, es una barra de estado altamente configurable para Neovim.
-- Proporciona información útil como el modo actual, el nombre del archivo, diagnósticos,
-- diferencias de Git y más. Es modular y permite personalizar tanto su diseño como
-- la información que muestra, adaptándose a las necesidades del usuario.

return {
	"nvim-lualine/lualine.nvim", -- Carga el plugin Lualine
	config = function() -- Configuración del plugin
		-- Configuración de la sección que muestra el modo actual (normal, inserción, visual, etc.)
		local mode = {
			"mode", -- Muestra el modo actual
			fmt = function(str) -- Formatea el texto del modo
				return " " .. str -- Añade un ícono antes del nombre del modo
				-- return ' ' .. str:sub(1, 1) -- (opcional) Muestra solo la primera letra del modo
			end,
		}

		-- Configuración para mostrar el nombre del archivo en la barra de estado
		local filename = {
			"filename", -- Muestra el nombre del archivo actual
			file_status = true, -- Indica si el archivo está modificado o en solo lectura
			path = 0, -- 0 = solo nombre del archivo, 1 = ruta relativa, 2 = ruta absoluta
		}

		-- Función para ocultar componentes si la ventana tiene un ancho reducido
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100 -- Solo muestra si la ventana tiene más de 100 columnas
		end

		-- Configuración para mostrar diagnósticos (errores y advertencias)
		local diagnostics = {
			"diagnostics", -- Muestra diagnósticos provenientes de LSP o fuentes similares
			sources = { "nvim_diagnostic" }, -- Fuente de los diagnósticos (nvim LSP)
			sections = { "error", "warn" }, -- Secciones que se mostrarán: errores y advertencias
			symbols = { error = " ", warn = " ", info = " ", hint = " " }, -- Íconos personalizados para cada tipo de diagnóstico
			colored = false, -- Desactiva los colores en los diagnósticos
			update_in_insert = false, -- No actualiza los diagnósticos mientras estás en modo inserción
			always_visible = false, -- No siempre visible; depende del ancho de la ventana
			cond = hide_in_width, -- Solo se muestra si la ventana tiene suficiente ancho
		}

		-- Configuración para mostrar diferencias de Git (archivos añadidos, modificados o eliminados)
		local diff = {
			"diff", -- Muestra diferencias de Git en la barra de estado
			colored = false, -- Desactiva colores en las diferencias
			symbols = { added = " ", modified = " ", removed = " " }, -- Íconos personalizados para cambios en Git
			cond = hide_in_width, -- Solo se muestra si la ventana tiene suficiente ancho
		}

		require("lualine").setup({ -- Inicializa Lualine con las configuraciones definidas
			options = {
				icons_enabled = true, -- Activa íconos en la barra de estado para mayor claridad visual
				theme = "gruvbox", -- Establece un tema visual para la barra (en este caso "nord")
				section_separators = { left = "", right = "" }, -- Separadores entre secciones de la barra de estado
				component_separators = { left = "", right = "" }, -- Separadores entre componentes dentro de una sección
				disabled_filetypes = { "alpha", "neo-tree" }, -- Tipos de archivos donde Lualine no se mostrará
				always_divide_middle = true, -- Siempre divide la barra en dos partes (izquierda y derecha)
			},
			sections = { -- Define las secciones visibles cuando la ventana está activa (enfocada)
				lualine_a = { mode }, -- Sección A: Muestra el modo actual (normal, inserción, etc.)
				lualine_b = { "branch" }, -- Sección B: Muestra la rama actual de Git (si aplica)
				lualine_c = { filename }, -- Sección C: Muestra el nombre del archivo actual abierto
				lualine_x = {
					diagnostics,
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				-- Sección X: Diagnósticos y diferencias de Git junto con codificación y tipo de archivo (si hay espacio suficiente)
				lualine_y = { "location" }, -- Sección Y: Muestra la ubicación actual del cursor en el archivo (línea y columna)
				lualine_z = { "progress" }, -- Sección Z: Muestra el progreso en porcentaje dentro del archivo actual
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- Configuración para una línea de pestañas; no utilizada aquí.
			extensions = { "fugitive" }, -- Extensiones adicionales; aquí se incluye fugitive para integración con Git.
		})
	end,
}
