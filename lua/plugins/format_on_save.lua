return {
	"elentok/format-on-save.nvim", -- Especifico el plugin que quiero instalar
	config = function()
		-- Importo el módulo format-on-save
		local format_on_save = require("format-on-save")
		-- Importo los formateadores disponibles
		local formatters = require("format-on-save.formatters")

		-- Configuro el plugin format-on-save
		format_on_save.setup({
			-- Excluyo ciertos directorios para evitar formatear archivos innecesarios
			exclude_path_patterns = {
				"/node_modules/", -- Ignoro archivos en node_modules
				".local/share/nvim/lazy", -- Ignoro archivos en la carpeta de plugins lazy
			},

			-- Defino los formateadores específicos para cada tipo de archivo
			-- si necesito otro lo puedo agregar aqui
			formatter_by_ft = {
				-- Uso google-java-format para archivos Java
				java = formatters.shell({ cmd = { "google-java-format", "-" } }),

				-- Uso black y ruff para archivos Python
				python = {
					formatters.shell({ cmd = { "black", "-" } }), -- Formateo con black
					formatters.shell({ cmd = { "ruff", "check", "--fix", "-" } }), -- Lint y arreglo con ruff
				},

				-- Uso sqlfmt para archivos SQL
				sql = formatters.shell({ cmd = { "sqlfmt", "-" } }),

				-- Uso rustfmt para archivos Rust
				rust = formatters.shell({ cmd = { "rustfmt" } }),

				-- Uso stylua para archivos Lua
				lua = formatters.shell({ cmd = { "stylua", "-" } }),
			},

			-- Formateador de respaldo en caso de que no se encuentre un formateador específico
			fallback_formatter = {
				formatters.remove_trailing_whitespace, -- Elimino espacios en blanco al final de las líneas
				formatters.remove_trailing_newlines, -- Elimino líneas en blanco al final del archivo
			},

			-- Opcional: Desactivo el uso de "sh -c" para ejecutar comandos de shell
			run_with_sh = false,
		})
	end,
}
