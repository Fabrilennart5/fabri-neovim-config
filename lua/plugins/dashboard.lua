return {
	{
		-- Estoy instalando el plugin 'dashboard-nvim' para crear un dashboard personalizado en Neovim.
		"nvimdev/dashboard-nvim",

		-- Le digo a Neovim que cargue este plugin cuando se inicie (evento 'VimEnter').
		event = "VimEnter",

		-- Configuro el plugin después de que se cargue.
		config = function()
			require("dashboard").setup({
				-- Aquí puedo agregar configuraciones personalizadas para el dashboard.
				theme = "hyper", -- Puedes cambiar el tema si lo deseas
				config = {
					header = {
						"███╗   ██╗ ██████╗      ██████╗ ███╗   ██╗███████╗     ██████╗ █████╗ ██████╗ ███████╗███████╗   ",
						"████╗  ██║██╔═══██╗    ██╔═══██╗████╗  ██║██╔════╝    ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝   ",
						"██╔██╗ ██║██║   ██║    ██║   ██║██╔██╗ ██║█████╗      ██║     ███████║██████╔╝█████╗  ███████╗   ",
						"██║╚██╗██║██║   ██║    ██║   ██║██║╚██╗██║██╔══╝      ██║     ██╔══██║██╔══██╗██╔══╝  ╚════██║   ",
						"██║ ╚████║╚██████╔╝    ╚██████╔╝██║ ╚████║███████╗    ╚██████╗██║  ██║██║  ██║███████╗███████║   ",
						"╚═╝  ╚═══╝ ╚═════╝      ╚═════╝ ╚═╝  ╚═══╝╚══════╝     ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝   ",
						"                                                                                                 ",
						"    ██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗    ██╗  ██╗ █████╗ ██████╗ ██████╗ ███████╗██████╗       ",
						"    ██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝    ██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔══██╗      ",
						"    ██║ █╗ ██║██║   ██║██████╔╝█████╔╝     ███████║███████║██████╔╝██║  ██║█████╗  ██████╔╝      ",
						"    ██║███╗██║██║   ██║██╔══██╗██╔═██╗     ██╔══██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██╔══██╗      ",
						"    ╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗    ██║  ██║██║  ██║██║  ██║██████╔╝███████╗██║  ██║      ",
						"     ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝      ",
					},
					-- Puedes agregar más configuraciones aquí, como shortcuts, footer, etc.
				},
			})
		end,

		-- Le indico que este plugin necesita 'nvim-web-devicons' para mostrar íconos.
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
