return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		-- Configuración del tema Gruvbox
		require("gruvbox").setup({
			terminal_colors = true, -- Agrega colores al terminal de Neovim
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true, -- Itálicas en cadenas de texto
				emphasis = true, -- Itálicas en énfasis (como markdown)
				comments = true, -- Itálicas en comentarios
				operators = false, -- No itálicas para operadores (como + o -)
				folds = true, -- Itálicas para dobleces (folds) del código
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,

			inverse = true, -- Invierte el fondo para búsqueda y diffs

			-- Puedes ajustar el contraste a "hard", "soft" o dejarlo vacío si no lo necesitas.
			-- Actualmente está vacío.
			contrast = "",
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,

			transparent_mode = false,
		})

		vim.cmd("colorscheme gruvbox")
	end,
}
