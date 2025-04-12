return {
	{
		"monkoose/neocodeium",
		event = "VeryLazy",
		config = function()
			local neocodeium = require("neocodeium")

			-- Configuración básica pero efectiva
			neocodeium.setup({
				enabled = true, -- Activo por defecto
				show_label = true, -- Muestra el contador de sugerencias
				debounce = false, -- Desactiva el debounce para respuestas más rápidas
				filetypes = {
					help = false, -- Desactiva en archivos de ayuda
					gitcommit = false, -- Desactiva en mensajes de commit
				},
			})

			-- Atajos de teclado ESSENCIALES (los que realmente uso)
			-- Aceptar sugerencia completa (Alt+f)
			vim.keymap.set("i", "<A-f>", neocodeium.accept, { desc = "Aceptar sugerencia Codeium" })

			-- Aceptar solo la palabra actual (Alt+w)
			vim.keymap.set("i", "<A-w>", neocodeium.accept_word, { desc = "Aceptar palabra Codeium" })

			-- Aceptar solo la línea actual (Alt+l)
			vim.keymap.set("i", "<A-l>", neocodeium.accept_line, { desc = "Aceptar línea Codeium" })

			-- Ciclar entre sugerencias (Alt+n)
			vim.keymap.set("i", "<A-n>", function()
				neocodeium.cycle_or_complete(1) -- Siguiente sugerencia
			end, { desc = "Siguiente sugerencia Codeium" })

			-- Ciclar hacia atrás (Alt+p)
			vim.keymap.set("i", "<A-p>", function()
				neocodeium.cycle_or_complete(-1) -- Sugerencia anterior
			end, { desc = "Anterior sugerencia Codeium" })

			-- Limpiar sugerencia actual (Alt+c)
			vim.keymap.set("i", "<A-c>", neocodeium.clear, { desc = "Limpiar sugerencia Codeium" })
		end,
	},
}
