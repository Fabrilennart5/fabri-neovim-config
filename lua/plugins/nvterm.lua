return {
	{
		"NvChad/nvterm",
		config = function()
			-- Configuro nvterm con las opciones deseadas
			require("nvterm").setup({
				terminals = {
					shell = vim.fn.has("win32") == 1 and "powershell" or nil,
					type_opts = {
						float = {
							relative = "editor",
							row = 0.15,
							col = 0.075,
							width = 0.85,
							height = 0.7,
							border = "rounded",
							winblend = 10,
						},
					},
				},
			})

			-- Aplicamos el fondo #252525 a las terminales
			vim.api.nvim_set_hl(0, "NvTerm", { bg = "#252525" })
			vim.api.nvim_set_hl(0, "NvTermFloat", { bg = "#252525" })

			-- Importo el módulo de terminal de nvterm
			local terminal = require("nvterm.terminal")
			local opts = { noremap = true, silent = true }

			-- Asigno la combinación de teclas <Leader>t (espacio + t)
			vim.keymap.set({ "n", "t" }, "<Leader>t", function()
				terminal.toggle("float")
			end, opts)
		end,
	},
}
