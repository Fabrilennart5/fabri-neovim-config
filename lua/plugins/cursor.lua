return {
	"gen740/SmoothCursor.nvim", -- Estoy usando el plugin SmoothCursor para mejorar la experiencia del cursor.
	config = function() -- Configuro el plugin aquí.
		require("smoothcursor").setup({
			type = "default", -- Uso el método de movimiento predeterminado del cursor.
			cursor = "➤", -- Coloco la forma que quiero que tenga el cursor.
			texthl = "GruvboxYellowBold", -- Le doy un color amarillo gruvbox en negrita para que sea más visible.
			linehl = "CursorLine", -- Resalto la línea completa bajo el cursor para saber dónde estoy.
			fancy = {
				enable = true, -- Activo el modo "fancy" para hacer el cursor más llamativo.
				head = { cursor = "➤", texthl = "GruvboxYellowBold" }, -- La cabeza del cursor mantiene la forma elegida.
				body = {
					{ cursor = "", texthl = "GruvboxOrangeBold" }, -- El cuerpo del cursor usa un color naranja gruvbox en negrita.
					{ cursor = "", texthl = "GruvboxRedBold" }, -- Añado más colores llamativos al cuerpo.
				},
				tail = { cursor = "", texthl = "GruvboxYellowBold" }, -- La cola del cursor mantiene la forma predeterminada.
			},
			autostart = true, -- El plugin se inicia automáticamente al abrir Neovim.
			speed = 20, -- Ajusto la velocidad del cursor para que sea más perceptible.
			intervals = 25, -- Configuro intervalos de actualización más cortos.
			threshold = 1, -- Animo el cursor incluso con movimientos pequeños.
			disabled_filetypes = { "TelescopePrompt", "NvimTree" }, -- Desactivo el plugin en ciertos tipos de archivos.
		})
	end,
}
