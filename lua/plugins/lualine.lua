return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Paleta de colores Gruvbox (sin cambios)
		local colors = {
			bg = "#3a3a3a",
			bg_light = "#3a3a3a",
			fg = "#e2cca9",
			yellow = "#e6b422",
			dark_yellow = "#d19a66",
			cyan = "#7daea3",
			green = "#a9b665",
			orange = "#e78a4e",
			magenta = "#d3869b",
			blue = "#7daea3",
			red = "#ea6962",
			gray = "#7c6f64",
			dark_gray = "#45403d",
		}

		-- Función para iconos profesionales del SO
		local function get_os_icon()
			-- Iconos profesionales por sistema operativo
			if vim.fn.has("mac") == 1 then
				return " " -- Icono MacOS
			elseif vim.fn.has("win32") == 1 then
				return " " -- Icono Windows
			elseif vim.fn.has("unix") == 1 then
				return " " -- Icono Linux
			end
			return " " -- Icono Neovim por defecto
		end

		-- Tema Gruvbox (sin cambios)
		local gruvbox_theme = {
			normal = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_light, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_light, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.orange, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_light, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_light, fg = colors.fg },
			},
			command = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg_light, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.bg, fg = colors.gray },
				b = { bg = colors.bg, fg = colors.gray },
				c = { bg = colors.bg, fg = colors.gray },
			},
		}

		-- Componentes con los cambios específicos solicitados
		local components = {
			left_a = {
				{
					"mode",
					fmt = function(str)
						return " " .. get_os_icon() .. str:sub(1, 1):upper() .. " " -- Icono SO + modo
					end,
					separator = { left = "", right = "" },
					color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				},
			},
			left_b = {
				{
					"filename",
					separator = { left = "", right = "" },
					color = { bg = colors.bg_light, fg = colors.fg },
				},
			},
			left_c = {
				{
					"branch",
					separator = { left = "", right = "" },
					color = { bg = colors.bg_light, fg = colors.fg },
				},
			},
			right_x = {
				{
					"diagnostics",
					symbols = { error = " ", warn = " ", info = " " },
					separator = { left = "", right = "" },
					color = { bg = colors.bg_light, fg = colors.fg },
				},
			},
			right_y = {
				{
					"filetype",
					separator = { left = "", right = "" },
					color = { bg = colors.bg_light, fg = colors.fg },
				},
			},
			right_z = {
				{
					"progress",
					fmt = function()
						return "%3p%% " .. "%3l:%2c" -- Porcentaje + línea:columna
					end,
					separator = { left = "", right = "" },
					color = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				},
			},
		}

		-- Configuración PRINCIPAL (sin cambios a la funcionalidad)
		require("lualine").setup({
			options = {
				theme = gruvbox_theme,
				component_separators = "",
				section_separators = "",
				disabled_filetypes = { statusline = { "neo-tree", "neo-tree-popup", "neo-tree-filesystem" } },
				globalstatus = true,
			},
			sections = {
				lualine_a = components.left_a,
				lualine_b = components.left_b,
				lualine_c = components.left_c,
				lualine_x = components.right_x,
				lualine_y = components.right_y,
				lualine_z = components.right_z,
			},
		})

		-- AUTOCMDS ORIGINALES QUE FUNCIONABAN (sin cambios)
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "neo-tree", "neo-tree-popup", "neo-tree-filesystem" },
			callback = function()
				vim.opt.laststatus = 0 -- Oculta la barra
				vim.opt.showmode = false -- Oculta el indicador de modo
			end,
		})

		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "*",
			callback = function()
				local ft = vim.bo.filetype
				if not (ft == "neo-tree" or ft == "neo-tree-popup" or ft == "neo-tree-filesystem") then
					vim.opt.laststatus = 3 -- Restaura la barra
					vim.opt.showmode = true -- Muestra el indicador de modo
				end
			end,
		})
	end,
}
