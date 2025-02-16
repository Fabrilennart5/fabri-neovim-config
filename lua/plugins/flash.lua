return {
	"folke/flash.nvim", -- Especifico el plugin Flash.nvim.
	config = function() -- Configuro el plugin.
		require("flash").setup({
			labels = "abcdefghijklmnopqrstuvwxyz", -- Letras que se usan para los saltos.
			highlight = { backdrop = false }, -- Personaliza el resaltado.
			modes = {
				search = { enabled = true }, -- Habilita la búsqueda con `F` o `f`.
			},
		})
	end,
}
