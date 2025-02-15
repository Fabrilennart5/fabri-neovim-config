return {
	-- Uso el plugin 'mfussenegger/nvim-jdtls' para soporte de Java con JDTLS (Java Development Tools Language Server).
	"mfussenegger/nvim-jdtls",
	-- Este plugin solo se carga cuando abro archivos Java (`ft = "java"`).
	ft = "java",
	dependencies = {
		-- Uso 'mfussenegger/nvim-dap' para la depuración con el protocolo DAP (Debug Adapter Protocol).
		"mfussenegger/nvim-dap",
		-- Uso 'rcarriga/nvim-dap-ui' para tener una interfaz gráfica del debugger.
		"rcarriga/nvim-dap-ui",
		-- Uso 'leoluz/nvim-dap-go' para depuración en Go (opcional, si necesito depurar código en Go).
		"leoluz/nvim-dap-go",
		-- Uso 'mfussenegger/nvim-dap-python' para depuración en Python.
		"mfussenegger/nvim-dap-python",
		-- Uso 'nvim-neotest/nvim-nio' como dependencia requerida por 'nvim-dap-ui'.
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- Cargo el módulo de JDTLS para configurar el soporte de Java.
		local jdtls = require("jdtls")
		-- Cargo el módulo de DAP para configurar la depuración.
		local dap = require("dap")
		-- Cargo el módulo de la interfaz gráfica del debugger (DAP UI).
		local dapui = require("dapui")

		-- Configuración de JDTLS para Java.
		local config = {
			-- Defino la ruta al ejecutable de JDTLS instalado por Mason.
			cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
			-- Busco la raíz del proyecto Java (donde está el archivo `gradlew`, `.git` o `mvnw`).
			root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
			-- Configuro una función que se ejecuta cuando JDTLS se adjunta a un buffer.
			on_attach = function(client, bufnr)
				-- Configuro DAP en JDTLS para permitir el reemplazo de código en caliente (hot code replace).
				jdtls.setup_dap({ hotcodereplace = "auto" })
				-- Configuro las clases principales para depuración en Java.
				require("jdtls.dap").setup_dap_main_class_configs()

				-- Desactivo el formateo automático del LSP para Java.
				-- Esto lo hago para evitar conflictos con otros formateadores.
				client.server_capabilities.documentFormattingProvider = false
				client.server_capabilities.documentRangeFormattingProvider = false
			end,
			-- Configuro opciones iniciales para JDTLS.
			init_options = {
				bundles = {
					-- Cargo el plugin de depuración de Java (java-debug-adapter) instalado por Mason.
					vim.fn.glob(
						vim.fn.stdpath("data")
							.. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
						1
					),
				},
			},
		}

		-- Inicio o adjunto JDTLS al proyecto Java actual.
		jdtls.start_or_attach(config)

		-- Configuro `dap` para Java.
		dap.configurations.java = {
			{
				type = "java", -- Tipo de configuración para Java.
				request = "launch", -- Modo de lanzamiento.
				name = "Launch Current File", -- Nombre de la configuración.
				mainClass = function()
					-- Obtengo la clase principal del archivo actual.
					return vim.fn.input("Main class: ", vim.fn.expand("%:t:r"), "file")
				end,
				projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"), -- Nombre del proyecto.
			},
			{
				type = "java",
				request = "attach", -- Modo de adjuntar a un proceso remoto.
				name = "Debug (Attach) - Remote",
				hostName = "127.0.0.1", -- Dirección del host remoto.
				port = 5005, -- Puerto del proceso remoto.
			},
		}

		-- Configuro `dap` para Python.
		require("dap-python").setup("python") -- Uso `debugpy` como adaptador para Python.
		dap.configurations.python = {
			{
				type = "python", -- Tipo de configuración para Python.
				request = "launch", -- Modo de lanzamiento.
				name = "Launch Python File", -- Nombre de la configuración.
				program = "${file}", -- Ejecuto el archivo actual.
				pythonPath = function()
					-- Obtengo la ruta de Python automáticamente (usa `python3` o `python`).
					return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
				end,
			},
		}

		-- Configuro el adaptador para Lua.
		dap.adapters.nlua = function(callback, config)
			callback({
				type = "server", -- Tipo de adaptador (servidor).
				host = config.host or "127.0.0.1", -- Dirección del host.
				port = config.port or 54231, -- Puerto del servidor.
			})
		end

		-- Configuro `dap` para Lua.
		dap.configurations.lua = {
			{
				type = "nlua", -- Tipo de configuración para Lua.
				request = "attach", -- Modo de adjuntar a un proceso en ejecución.
				name = "Attach to Running Neovim", -- Nombre de la configuración.
				host = function()
					return "127.0.0.1" -- Dirección del host.
				end,
				port = function()
					return 54231 -- Puerto del servidor.
				end,
			},
		}

		-- Configuro `dap` para Rust.
		dap.configurations.rust = {
			{
				type = "lldb", -- Tipo de configuración para Rust (usa LLDB).
				request = "launch", -- Modo de lanzamiento.
				name = "Launch Rust Program", -- Nombre de la configuración.
				program = function()
					-- Obtengo la ruta al ejecutable de Rust (en `target/debug/`).
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
				end,
				cwd = "${workspaceFolder}", -- Directorio de trabajo.
				stopOnEntry = false, -- No se detiene al inicio del programa.
				args = {}, -- Argumentos para el programa.
			},
		}

		-- Configuro la interfaz gráfica del debugger (nvim-dap-ui).
		dapui.setup() -- Inicializo la UI del debugger.

		-- Defino listeners para abrir y cerrar la UI del debugger automáticamente.
		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open() -- Abro la UI cuando se inicia la depuración.
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close() -- Cierro la UI cuando termina la depuración.
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close() -- Cierro la UI cuando el programa termina.
		end
	end,
}
