return { -- Devuelve la configuración del plugin nvim-treesitter
	"nvim-treesitter/nvim-treesitter", -- Especifica el plugin a instalar
	build = ":TSUpdate", -- Comando para actualizar Treesitter después de la instalación
	main = "nvim-treesitter.configs", -- Establece el módulo principal que se usará para las opciones

	-- [[ Configuración de Treesitter ]] Consulta `:help nvim-treesitter` para más información
	opts = {
		ensure_installed = { -- Lista de lenguajes que se asegurarán de estar instalados
			"lua",
			"python",
			"javascript",
			"typescript",
			"vimdoc",
			"vim",
			"regex",
			"terraform",
			"sql",
			"dockerfile",
			"toml",
			"json",
			"java",
			"rust",
			"go",
			"gitignore",
			"graphql",
			"yaml",
			"make",
			"cmake",
			"markdown",
			"markdown_inline",
			"bash",
			"tsx",
			"css",
			"html",
		},
		-- Autoinstalar lenguajes que no están instalados
		auto_install = true, -- Habilita la instalación automática de lenguajes

		highlight = { -- Configuración para la funcionalidad de resaltado
			enable = true, -- Habilita el resaltado de sintaxis
			-- Algunas lenguas dependen del sistema de resaltado regex de Vim (como Ruby) para las reglas de indentación.
			-- Si experimentas problemas extraños de indentación, añade el lenguaje a
			-- la lista de additional_vim_regex_highlighting y desactiva lenguajes para la indentación.
			additional_vim_regex_highlighting = { "ruby" }, -- Añade Ruby a la lista de lenguajes que usan resaltado regex adicional
		},

		indent = { enable = true, disable = { "ruby" } }, -- Habilita la indentación automática, desactiva para Ruby
	},
}
