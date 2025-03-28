return {
	-- Plugin para múltiples cursores (similar a VS Code)
	-- Lo uso para editar varias partes del texto al mismo tiempo
	"smoka7/multicursors.nvim",

	-- Carga el plugin solo cuando es necesario (optimización de rendimiento)
	event = "VeryLazy",

	-- Dependencia necesaria para el funcionamiento avanzado
	dependencies = {
		"nvimtools/hydra.nvim", -- Proporciona menús interactivos y modos especiales
	},

	-- Configuración básica (puedo personalizarlo más adelante si lo necesito)
	opts = {},

	-- Comandos que activan diferentes modos de múltiples cursores:
	cmd = {
		"MCstart", -- Inicia selección múltiple
		"MCvisual", -- Modo visual para selección
		"MCclear", -- Limpia todos los cursores
		"MCpattern", -- Busca por patrón
		"MCvisualPattern", -- Patrón en modo visual
		"MCunderCursor", -- Selecciona palabra bajo cursor
	},

	-- Atajo de teclado personalizado:
	keys = {
		{
			-- Funciona en modo normal (n) y visual (v)
			mode = { "v", "n" },

			-- Uso <Leader>m para activarlo (mi tecla líder es espacio)
			"<Leader>m",

			-- Ejecuta el comando principal de inicio
			"<cmd>MCstart<cr>",

			-- Descripción para el menú de ayuda
			desc = "Activar múltiples cursores (selección actual o palabra bajo cursor)",
		},
	},
}
