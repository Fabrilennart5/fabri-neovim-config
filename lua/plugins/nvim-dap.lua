-- Configuración principal para nvim-dap (Debug Adapter Protocol)
-- Esta versión corrige los warnings de deprecated y mantiene toda la funcionalidad

return {
	{
		"mfussenegger/nvim-dap", -- Plugin principal para debugging en Neovim
		dependencies = {
			"nvim-neotest/nvim-nio", -- Necesario para operaciones asíncronas

			-- Configuración específica para nvim-dap-ui con solución al warning
			{
				"rcarriga/nvim-dap-ui",
				config = function()
					-- Configuración optimizada que evita el uso de funciones deprecated
					require("dapui").setup({
						-- Configuración básica de elementos
						icons = {
							expanded = "▾",
							collapsed = "▸",
							current_frame = "▶",
						},

						-- Layout simplificado que funciona sin warnings
						layouts = {
							{
								elements = {
									{ id = "scopes", size = 0.25 },
									{ id = "breakpoints", size = 0.25 },
									{ id = "stacks", size = 0.25 },
									{ id = "watches", size = 0.25 },
								},
								position = "left",
								size = 40,
							},
							{
								elements = {
									{ id = "repl", size = 0.5 },
									{ id = "console", size = 0.5 },
								},
								position = "bottom",
								size = 10,
							},
						},

						-- Configuración de controles (actualizada)
						controls = {
							enabled = true,
							element = "repl",
						},
					})
				end,
			},

			"mfussenegger/nvim-dap-python", -- Debugger específico para Python
			"theHamsta/nvim-dap-virtual-text", -- Muestra valores de variables durante debugging
		},
		config = function()
			-- Cargamos los módulos necesarios
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_python = require("dap-python")

			-- Configuración del debugger para Python
			dap_python.setup("python", {
				-- Opciones avanzadas para Python
				python_path = "python3",
				console = "integratedTerminal",
				justMyCode = false, -- Permite depurar código de bibliotecas
			})

			-- Configuración de texto virtual (mejorado)
			require("nvim-dap-virtual-text").setup({
				commented = true, -- Muestra valores como comentarios
				enabled = true, -- Activa el plugin
				virt_text_pos = "eol", -- Posición del texto
				all_frames = false, -- Solo muestra valores del frame actual
			})

			-- Definición de iconos para breakpoints (los mismos que tenías)
			vim.fn.sign_define("DapBreakpoint", {
				text = "", -- Icono para breakpoint activo
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapBreakpointRejected", {
				text = "", -- Icono para breakpoint rechazado
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})

			vim.fn.sign_define("DapStopped", {
				text = "", -- Icono cuando el debugger se detiene
				texthl = "DiagnosticSignWarn",
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})

			-- Configuración de listeners para integración con dap-ui (mejorada)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({ reset = true }) -- Abre con layout limpio
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Atajos de teclado (opcionales, puedes mantener los tuyos)
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, opts)
			vim.keymap.set("n", "<leader>dc", dap.continue, opts)
			vim.keymap.set("n", "<leader>do", dap.step_over, opts)
			vim.keymap.set("n", "<leader>di", dap.step_into, opts)
			vim.keymap.set("n", "<leader>dO", dap.step_out, opts)
			vim.keymap.set("n", "<leader>dq", dap.terminate, opts)
			vim.keymap.set("n", "<leader>du", dapui.toggle, opts)

			-- Atajo adicional útil para evaluación
			vim.keymap.set("n", "<leader>de", function()
				dapui.eval(vim.fn.input("Expression: "))
			end, opts)
		end,
	},
}
