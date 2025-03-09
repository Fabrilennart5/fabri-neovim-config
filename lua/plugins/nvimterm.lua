return {
	{
		"NvChad/nvterm",
		config = function()
			-- Configuro nvterm con las opciones deseadas
			require("nvterm").setup({
				terminals = {
					shell = vim.fn.has("win32") == 1 and "powershell" or nil, -- Si es Windows, usa PowerShell; de lo contrario, usa el shell predeterminado
					type_opts = {
						float = {
							relative = "editor", -- La terminal flotante se posiciona en relación con el editor
							row = 0.15, -- Posición vertical desde la parte superior
							col = 0.075, -- Posición horizontal desde la izquierda
							width = 0.85, -- Ancho de la terminal flotante (85% del editor)
							height = 0.7, -- Altura de la terminal flotante (70% del editor)
							border = "rounded", -- Borde redondeado para mejor apariencia
							winblend = 10, -- Nivel de transparencia (0 = sólido, 100 = invisible)
						},
					},
				},
			})

			-- Importo el módulo de terminal de nvterm
			local terminal = require("nvterm.terminal")
			local opts = { noremap = true, silent = true }

			-- Asigno la combinación de teclas <Leader>t (espacio + t)
			-- para abrir o cerrar la terminal flotante
			vim.keymap.set({ "n", "t" }, "<Leader>t", function()
				terminal.toggle("float")
			end, opts)
		end,
	},
}
