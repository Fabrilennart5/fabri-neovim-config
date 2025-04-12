return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	init = function()
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NeoTree" })
		vim.keymap.set("n", "<leader>f", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file" })
	end,
	opts = {
		close_if_last_window = true,
		popup_border_style = "single",
		enable_git_status = true,
		enable_diagnostics = true,
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "",
			},
			git_status = {
				symbols = {
					added = "", -- Amarillo Gruvbox
					deleted = "", -- Rojo Gruvbox
					modified = "", -- Azul Gruvbox
					renamed = "➜", -- Verde Gruvbox
					untracked = "★", -- Naranja Gruvbox
				},
			},
		},
		window = {
			position = "right",
			width = 35,
			mappings = {
				["h"] = "close_node",
				["l"] = "open",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
			},
		},
		highlight = {
			fill = "NeoTreeNormal",
			background = "#252525", -- Cambiado a tu color preferido
			stroke = "#504945", -- Borde en tono Gruvbox
		},
	},
	config = function(_, opts)
		-- Aplicamos los colores personalizados
		vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#252525", fg = "#ebdbb2" })
		vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", { bg = "#252525", fg = "#252525" })
		vim.api.nvim_set_hl(0, "NeoTreeVertSplit", { fg = "#504945", bg = "#252525" })
		vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#504945", bg = "#252525" })

		-- Colores adicionales para mejor integración
		vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#a89984" }) -- Nombres de carpetas
		vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#ebdbb2" }) -- Nombres de archivos
		vim.api.nvim_set_hl(0, "NeoTreeRootName", { fg = "#d79921", bold = true }) -- Root folder

		require("neo-tree").setup(opts)
	end,
}
