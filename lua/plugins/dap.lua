return {
	"mfussenegger/nvim-dap", -- Plugin principal para depuración en Neovim
	dependencies = {
		"rcarriga/nvim-dap-ui", -- Interfaz de usuario para nvim-dap
		"nvim-neotest/nvim-nio", -- Dependencia requerida por nvim-dap-ui
		"mfussenegger/nvim-dap-python", -- Dependencia requerida para Python
		-- "mfussenegger/nvim-jdtls", -- Dependencia requerida para Java
	},
	config = function()
		local dap = require("dap") -- Carga el módulo de depuración
		local dapui = require("dapui") -- Carga el módulo de la interfaz de usuario

		-- Configura el módulo de depuración para Python
		require("dap-python").setup()

		-- Configura el adaptador (cppdbg)
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/fabri/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
		}

		-- Configuraciones para Rust (extraídas de la imagen)
		dap.configurations.rust = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gobserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
			},
		}

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
		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end) -- Inicia o continúa la depuración
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end) -- Salta sobre una línea de código
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end) -- Entra en una función
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end) -- Sale de una función
		vim.keymap.set("n", "<Leader>dr", function()
			dap.repl.open()
		end) -- Abre la consola de depuración
	end,
}
