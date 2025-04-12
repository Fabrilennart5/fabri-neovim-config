return {
	{
		"CRAG666/code_runner.nvim",
		dependencies = {
			"CRAG666/betterTerm.nvim", -- Necesario para el modo toggle runner
		},
		config = function()
			-- Configuro el plugin sin atajos de teclado
			require("code_runner").setup({
				-- Elijo el modo por defecto para ejecutar el código
				mode = "float",

				-- Defino cómo se ejecutará cada tipo de archivo
				filetype = {
					python = "python3 -u", -- Uso python3 con buffers no almacenados
					javascript = "node", -- Ejecuto JavaScript con Node
					typescript = "deno run", -- Uso Deno para TypeScript
					java = { -- Configuración para Java
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},
					c = { -- Configuración para C
						"cd $dir &&",
						"gcc $fileName -o $fileNameWithoutExt &&",
						"./$fileNameWithoutExt",
					},
					cpp = { -- Configuración para C++
						"cd $dir &&",
						"g++ $fileName -o $fileNameWithoutExt &&",
						"./$fileNameWithoutExt",
					},
					rust = "cargo run", -- Uso Cargo para Rust
					sh = "bash", -- Ejecuto shell scripts con bash
					lua = "lua", -- Configuración para Lua
					go = "go run", -- Configuración para Go
				},

				-- Configuro la ventana flotante
				float = {
					border = "single", -- Elijo un borde simple para la ventana
					height = 0.8, -- Defino la altura al 80% de la pantalla
					width = 0.8, -- Defino el ancho al 80% de la pantalla
					x = 0.5, -- Centro la ventana horizontalmente
					y = 0.5, -- Centro la ventana verticalmente
				},

				-- Configuro el terminal cuando se usa ese modo
				term = {
					position = "bot", -- Posiciono el terminal abajo
					size = 10, -- Defino 10 líneas de altura
				},

				-- Desactivo completamente el auto-run al guardar
				startinsert = false, -- No entro en modo inserción automáticamente
				autosave = false, -- No guardo automáticamente antes de ejecutar
			})
		end,
	},
}
