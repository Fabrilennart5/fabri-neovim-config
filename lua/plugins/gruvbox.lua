return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	lazy = false,

	config = function()
		require("gruvbox").setup({
			-- Configuración base
			contrast = "hard", -- Contraste fuerte (similar a Material Dark)
			palette_overrides = {
				-- Fondo personalizado (gris oscuro neutro, no azulado)
				dark0_hard = "#252525", -- Casi negro pero con tono gris (más moderno)
				dark0 = "#2e2e2e", -- Base principal (un poco más claro)
				dark1 = "#3a3a3a", -- Para líneas activas (similar a tu preferencia)
				dark2 = "#444444", -- Para elementos secundarios

				-- Ajusto estos colores para que combinen con el nuevo fondo
				gray = "#928374", -- Gris desaturado para comentarios
				light0 = "#ebdbb2", -- Texto principal (beige claro)
			},
			overrides = {
				-- Grupos de highlight para mantener coherencia
				["@function"] = { fg = "#fe8019", bold = true }, -- Naranja brillante
				["@variable"] = { fg = "#ebdbb2" }, -- Beige neutro
				Normal = { bg = "#252525" }, -- Fuerzo el fondo en el grupo Normal
				NormalFloat = { bg = "#2e2e2e" }, -- Ventanas flotantes
			},
		})

		-- Aplico el tema y ajustes adicionales
		vim.cmd.colorscheme("gruvbox")

		-- Opcional: Aseguro transparencia en algunas áreas
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#928374", bg = "NONE" })
	end,
}
