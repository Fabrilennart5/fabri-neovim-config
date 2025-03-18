-- Archivo de configuración para el plugin "harpoon".
-- Este plugin me permite marcar y saltar rápidamente entre archivos importantes en mi proyecto.

return { -- Añado el return para que el plugin se cargue correctamente con lazy.nvim.
	"ThePrimeagen/harpoon", -- Especifico el repositorio del plugin en GitHub.
	event = "VeryLazy", -- Cargo el plugin de manera perezosa (lazy) para no afectar el tiempo de inicio de Neovim.
	dependencies = {
		"nvim-lua/plenary.nvim", -- Dependencia necesaria para que el plugin funcione correctamente.
	},
	opts = {}, -- Opciones de configuración del plugin. Por ahora, las dejo vacías para usar los valores predeterminados.
	keys = { -- Defino atajos de teclado para usar las funcionalidades del plugin.
		{
			mode = { "n" }, -- Estos atajos funcionan en modo normal (n).
			"<Leader>a", -- Uso <Leader>a para marcar un archivo.
			'<cmd>lua require("harpoon.mark").add_file()<cr>', -- Ejecuto la función para marcar un archivo.
			desc = "Marcar un archivo con Harpoon", -- Descripción del atajo.
		},
		{
			mode = { "n" }, -- Estos atajos funcionan en modo normal (n).
			"<Leader>1", -- Uso <Leader>1 para saltar al primer archivo marcado.
			'<cmd>lua require("harpoon.ui").nav_file(1)<cr>', -- Ejecuto la función para saltar al archivo 1.
			desc = "Saltar al primer archivo marcado", -- Descripción del atajo.
		},
		{
			mode = { "n" }, -- Estos atajos funcionan en modo normal (n).
			"<Leader>2", -- Uso <Leader>2 para saltar al segundo archivo marcado.
			'<cmd>lua require("harpoon.ui").nav_file(2)<cr>', -- Ejecuto la función para saltar al archivo 2.
			desc = "Saltar al segundo archivo marcado", -- Descripción del atajo.
		},
		{
			mode = { "n" }, -- Estos atajos funcionan en modo normal (n).
			"<Leader>3", -- Uso <Leader>3 para saltar al tercer archivo marcado.
			'<cmd>lua require("harpoon.ui").nav_file(3)<cr>', -- Ejecuto la función para saltar al archivo 3.
			desc = "Saltar al tercer archivo marcado", -- Descripción del atajo.
		},
		{
			mode = { "n" }, -- Estos atajos funcionan en modo normal (n).
			"<Leader>4", -- Uso <Leader>4 para saltar al cuarto archivo marcado.
			'<cmd>lua require("harpoon.ui").nav_file(4)<cr>', -- Ejecuto la función para saltar al archivo 4.
			desc = "Saltar al cuarto archivo marcado", -- Descripción del atajo.
		},
	},
}
