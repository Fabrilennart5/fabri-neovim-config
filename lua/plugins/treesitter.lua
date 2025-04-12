return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Actualizo parsers al instalar/actualizar

	-- Configuro Treesitter para que use los colores de Gruvbox sin sobrescribirlos
	opts = {
		-- Lenguajes que siempre quiero tener instalados
		ensure_installed = {
			"lua",
			"python",
			"javascript",
			"typescript",
			"bash",
			"rust",
			"go",
			"html",
			"css",
			"json",
			"yaml",
			"markdown",
			"vim",
		},

		-- Autoinstalo parsers si falta alguno
		auto_install = true,

		highlight = {
			enable = true,
			-- Desactivo regex highlighting para evitar conflictos con Gruvbox
			additional_vim_regex_highlighting = false,
			-- Uso el nuevo motor de colores (más preciso)
			use_languagetree = true,
		},

		indent = { enable = true }, -- Indentación automática
	},

	config = function(_, opts)
		-- Primero configuro Treesitter
		require("nvim-treesitter.configs").setup(opts)

		-- Luego aseguro que Gruvbox aplique sus colores
		vim.defer_fn(function()
			vim.cmd("colorscheme gruvbox")
		end, 100) -- Pequeño delay para evitar race conditions
	end,
}
