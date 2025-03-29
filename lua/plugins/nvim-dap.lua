return {
	{
		"mfussenegger/nvim-dap", -- Uso el plugin nvim-dap para debugging en Neovim
		dependencies = {
			"nvim-neotest/nvim-nio", -- Necesito nvim-nio para operaciones asíncronas
			"rcarriga/nvim-dap-ui", -- Integro la interfaz de usuario para DAP
			"mfussenegger/nvim-dap-python", -- Añado soporte específico para Python
			"theHamsta/nvim-dap-virtual-text", -- Muestro texto virtual durante el debugging
		},
		config = function()
			-- Cargo los módulos necesarios
			local dap = require("dap") -- Módulo principal de debugging
			local dapui = require("dapui") -- Interfaz de usuario
			local dap_python = require("dap-python") -- Adaptador para Python

			-- Configuro la interfaz de usuario
			require("dapui").setup({})

			-- Configuro el texto virtual durante el debugging
			require("nvim-dap-virtual-text").setup({
				commented = true, -- Muestro el texto virtual como comentarios
			})

			-- Configuro el debugger para Python usando python3
			dap_python.setup("python")

			-- Defino iconos visuales para los breakpoints
			vim.fn.sign_define("DapBreakpoint", {
				text = "", -- Icono para breakpoint activo
				texthl = "DiagnosticSignError", -- Resaltado como error
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
				texthl = "DiagnosticSignWarn", -- Resaltado como advertencia
				linehl = "Visual",
				numhl = "DiagnosticSignWarn",
			})

			-- Configuro apertura automática de la interfaz al iniciar debugging
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			local opts = { noremap = true, silent = true } -- Opciones para los atajos de teclado

			-- Defino atajos de teclado para controlar el debugging:

			-- <leader>db - Alternar breakpoint
			vim.keymap.set("n", "<leader>db", function()
				dap.toggle_breakpoint()
			end, opts)

			-- <leader>dc - Continuar/Iniciar sesión de debugging
			vim.keymap.set("n", "<leader>dc", function()
				dap.continue()
			end, opts)

			-- <leader>do - Paso por encima (step over)
			vim.keymap.set("n", "<leader>do", function()
				dap.step_over()
			end, opts)

			-- <leader>di - Paso adentro (step into)
			vim.keymap.set("n", "<leader>di", function()
				dap.step_into()
			end, opts)

			-- <leader>dO - Paso afuera (step out)
			vim.keymap.set("n", "<leader>dO", function()
				dap.step_out()
			end, opts)

			-- <leader>dq - Terminar sesión de debugging
			vim.keymap.set("n", "<leader>dq", function()
				require("dap").terminate()
			end, opts)

			-- <leader>du - Alternar interfaz de usuario de DAP
			vim.keymap.set("n", "<leader>du", function()
				dapui.toggle()
			end, opts)
		end,
	},
}
