return {
	-- Especifico el nombre del plugin que quiero usar.
	"smoka7/multicursors.nvim",

	-- Defino cuándo se cargará el plugin. En este caso, se carga de manera "perezosa" (lazy)
	-- cuando ocurre el evento "VeryLazy", lo que significa que no se carga hasta que es necesario.
	event = "VeryLazy",

	-- Aquí indico las dependencias que necesita este plugin para funcionar.
	-- En este caso, depende de 'nvimtools/hydra.nvim'.
	dependencies = {
		"nvimtools/hydra.nvim",
	},

	-- Aquí puedo pasar opciones adicionales al plugin, pero en este caso no hay ninguna configuración especial.
	opts = {},

	-- Defino los comandos que este plugin proporciona. Estos comandos me permiten interactuar con el plugin.
	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },

	-- Aquí configuro las combinaciones de teclas que activarán las funciones del plugin.
	keys = {
		{
			-- Especifico los modos en los que esta combinación de teclas funcionará.
			-- En este caso, funciona en modo visual ('v') y normal ('n').
			mode = { "v", "n" },

			-- Defino la combinación de teclas que activará la función.
			-- Aquí, al presionar `<Leader>m`, se ejecutará el comando `MCstart`.
			"<Leader>m",

			-- Este es el comando que se ejecutará al presionar la combinación de teclas.
			"<cmd>MCstart<cr>",

			-- Aquí describo lo que hace esta combinación de teclas.
			-- En este caso, crea una selección para el texto seleccionado o la palabra bajo el cursor.
			desc = "Create a selection for selected text or word under the cursor",
		},
	},
}
