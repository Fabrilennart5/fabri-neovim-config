return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- Opcional: estado de git
		"nvim-tree/nvim-web-devicons", -- Opcional: íconos
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {}, -- Configuración por defecto (sin personalizaciones extra)
	version = "^1.0.0", -- Fija versión estable (1.x.x)
}
