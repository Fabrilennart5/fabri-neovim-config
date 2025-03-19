return {
	-- Estoy usando 'nvim-tabline' en lugar de 'barbar.nvim'
	"crispgm/nvim-tabline",

	-- Este plugin depende de 'nvim-web-devicons' para mostrar iconos en la barra de pestañas
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- opcional, pero útil

	-- Activo la configuración predeterminada del plugin automáticamente
	config = true,
}
