return {
	-- Especifico el plugin que quiero instalar
	"stevearc/conform.nvim",
	-- Configuro el plugin
	config = function()
		-- Importo el módulo conform
		local conform = require("conform")

		-- Configuro el plugin conform.nvim
		conform.setup({
			-- Defino los formateadores por tipo de archivo
			formatters_by_ft = {
				-- Para Python: uso "isort" para ordenar imports y "black" para formatear
				python = { "isort", "ruff" },

				-- Para Rust: uso "rustfmt" para formatear
				rust = { "rustfmt" },

				-- Para Java: uso "google-java-format" para formatear
				java = { "google-java-format" },

				-- Para SQL: uso "sqlfmt" para formatear
				sql = { "sqlfmt" },

				-- Para Lua: uso "stylua" para formatear
				lua = { "stylua" },
			},

			-- Habilito el formateo automático al guardar
			format_on_save = {
				-- Tiempo máximo de espera para el formateo (en milisegundos)
				timeout_ms = 500,

				-- Si el formateador LSP está disponible, lo uso como respaldo
				lsp_format = "fallback",
			},
		})

		-- Configuro un atajo para formatear manualmente con Ctrl + s
		vim.keymap.set("n", "<C-s>", function()
			conform.format({ async = true, lsp_format = "fallback" })
		end, { desc = "Formatear el archivo actual" })

		-- Configuro el formateo automático al guardar con :w
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				conform.format({ bufnr = args.buf, async = false })
			end,
		})
	end,
}
