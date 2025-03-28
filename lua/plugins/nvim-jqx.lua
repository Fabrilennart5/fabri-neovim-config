return {
	-- Plugin para visualizar y navegar archivos JSON/YAML de forma interactiva
	"gennaro-tedesco/nvim-jqx",

	-- Se carga automáticamente cuando abro archivos (ahorra memoria cuando no lo uso)
	event = { "BufReadPost" },

	-- Solo funciona con estos tipos de archivos:
	ft = { "json", "yaml" }, -- Soporta tanto JSON como YAML
}
