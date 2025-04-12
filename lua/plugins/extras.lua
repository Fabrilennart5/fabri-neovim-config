-- Aquí van los plugins independientes con menos de 10 líneas de configuración
return {
	{
		-- Plugin que muestra atajos de teclado disponibles
		"folke/which-key.nvim",
	},
	{
		-- Plugin que cierra automáticamente paréntesis, corchetes, comillas, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter", -- Se carga cuando entro en modo de inserción
		config = true, -- Activar la configuración del plugin
		opts = {}, -- Opciones adicionales (vacías por ahora)
	},
	{
		-- Plugin que resalta comentarios como TODO, notas, etc.
		"folke/todo-comments.nvim",
		event = "VimEnter", -- Se carga al iniciar Vim
		dependencies = { "nvim-lua/plenary.nvim" }, -- Necesita este plugin para funcionar
		opts = { signs = false }, -- No mostrar signos en los comentarios resaltados
	},
	{
		-- REEMPLAZO PARA COLORIZER - Moderno y sin errores
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				render = "background", -- 'foreground' o 'background' (prefiero background)
				enable_named_colors = true, -- Reconoce nombres de colores como 'red'
				enable_tailwind = true, -- Soporte para colores TailwindCSS
			})
		end,
	},
}
