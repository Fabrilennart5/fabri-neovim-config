return {
	-- Uso el plugin 'andweeb/presence.nvim' para mostrar mi actividad de Neovim en Discord.
	"andweeb/presence.nvim",
	event = "VimEnter", -- Cargo el plugin tan pronto como Neovim inicia.
	config = function()
		-- Configuro el plugin con las opciones que necesito.
		require("presence").setup({
			-- Opciones generales
			auto_update = true, -- Habilito la actualización automática de la actividad en Discord basada en eventos de Neovim.
			neovim_image_text = "The One True Text Editor", -- Texto que se muestra al pasar el cursor sobre la imagen de Neovim en Discord.
			main_image = "neovim", -- Uso la imagen de Neovim como ícono principal en Discord.
			client_id = "793271441293967371", -- ID de la aplicación de Discord (no recomiendo cambiarlo a menos que crees tu propia aplicación).
			log_level = nil, -- No establezco un nivel de registro específico, por lo que no se mostrarán mensajes de log.
			debounce_timeout = 10, -- Tiempo en segundos para agrupar eventos y evitar actualizaciones frecuentes en Discord.
			enable_line_number = false, -- Desactivo la visualización del número de línea actual en Discord.
			blacklist = {}, -- No tengo una lista negra de archivos o rutas que desactiven Rich Presence.
			buttons = true, -- Habilito los botones en Discord para que otros puedan ver mi repositorio o archivo actual.
			file_assets = {}, -- No defino activos personalizados para tipos de archivos específicos.
			show_time = true, -- Muestro el tiempo transcurrido desde que empecé a usar Neovim.

			-- Opciones de texto para Rich Presence
			editing_text = "Editando %s", -- Texto que se muestra cuando estoy editando un archivo. %s se reemplaza con el nombre del archivo.
			file_explorer_text = "Navegando %s", -- Texto que se muestra cuando estoy usando un explorador de archivos.
			git_commit_text = "Haciendo commit de cambios", -- Texto que se muestra cuando estoy haciendo un commit en Git.
			plugin_manager_text = "Gestionando plugins", -- Texto que se muestra cuando estoy gestionando plugins.
			reading_text = "Leyendo %s", -- Texto que se muestra cuando estoy leyendo un archivo de solo lectura.
			workspace_text = "Trabajando en %s", -- Texto que se muestra cuando estoy trabajando en un proyecto dentro de un repositorio Git.
			line_number_text = "Línea %s de %s", -- Texto que se muestra si `enable_line_number` está activo (muestra el número de línea actual y el total).
		})
	end,
}
