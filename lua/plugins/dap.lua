return {
	"mfussenegger/nvim-dap", -- Plugin principal para depuración en Neovim
	dependencies = {
		"rcarriga/nvim-dap-ui", -- Interfaz de usuario para nvim-dap
		"nvim-neotest/nvim-nio", -- Dependencia requerida por nvim-dap-ui
		"mfussenegger/nvim-dap-python", -- Dependencia requerida para Python
		--	"mfussenegger/nvim-jdtls", -- Dependencia requerida para  Java
	},
	config = function()
		local dap = require("dap") -- Carga el módulo de depuración
		local dapui = require("dapui") -- Carga el módulo de la interfaz de usuario

		-- Configura el módulo de depuración para Python
		require("dap-python").setup()
		-- Configura el módulo de depuración para Java
		--	require("nvim-jdtls").setup()

		-- Inicializa nvim-dap-ui
		dapui.setup()

		-- Configura listeners para abrir la interfaz de usuario al adjuntar o lanzar la depuración
		dap.listeners.before.attach.dapui_config = function()
			dapui.open() -- Abre la interfaz de usuario cuando se adjunta el depurador
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open() -- Abre la interfaz de usuario cuando se lanza la depuración
		end

		-- Configura listeners para cerrar la interfaz de usuario al terminar o salir de la depuración
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close() -- Cierra la interfaz de usuario cuando la depuración termina
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close() -- Cierra la interfaz de usuario cuando se sale de la depuración
		end

		-- Configura atajos de teclado para funciones de depuración
		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {}) -- Alterna un punto de interrupción
		vim.keymap.set("n", "<Leader>dc", dap.continue, {}) -- Continúa la ejecución hasta el siguiente punto de interrupción
	end,
}
