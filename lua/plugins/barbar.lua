-- Plugin para manejar las pestañas
-- en el codigo
return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- para el  status de git
		"nvim-tree/nvim-web-devicons", -- para los  iconos
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- opciones personalizadas.
	},
	version = "^1.0.0", -- version de barbar
}
