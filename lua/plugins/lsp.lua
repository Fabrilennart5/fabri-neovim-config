return {
	-- Configuración principal del LSP (Language Server Protocol).
	-- Aquí estoy utilizando el plugin 'nvim-lspconfig' para configurar los servidores LSP en Neovim.
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Mason es un gestor de paquetes que me permite instalar y gestionar LSPs, formateadores, linters, etc.
		-- 'williamboman/mason.nvim' es el plugin principal de Mason, y lo configuro con `config = true` para que se inicialice automáticamente.
		{ "williamboman/mason.nvim", config = true },

		-- 'mason-lspconfig.nvim' es una extensión que integra Mason con 'nvim-lspconfig'.
		-- Esto me permite configurar automáticamente los LSPs que instalo con Mason.
		"williamboman/mason-lspconfig.nvim",

		-- 'mason-tool-installer.nvim' es un plugin que me permite instalar automáticamente herramientas adicionales,
		-- como formateadores y linters, cuando configuro Mason.
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- 'fidget.nvim' es un plugin que muestra el progreso de las operaciones del LSP en la esquina inferior derecha de Neovim.
		-- Esto me ayuda a saber cuándo el LSP está trabajando en segundo plano.
		{ "j-hui/fidget.nvim", opts = {} },

		-- Los siguientes plugins son para el sistema de autocompletado (completion) en Neovim.
		-- 'cmp-nvim-lsp' proporciona capacidades adicionales de autocompletado basadas en el LSP.
		"hrsh7th/cmp-nvim-lsp",

		-- 'nvim-cmp' es el plugin principal de autocompletado en Neovim.
		"hrsh7th/nvim-cmp",

		-- 'LuaSnip' es un motor de snippets que me permite usar fragmentos de código predefinidos.
		"L3MON4D3/LuaSnip",

		-- 'cmp_luasnip' integra LuaSnip con nvim-cmp para que los snippets funcionen con el autocompletado.
		"saadparwaiz1/cmp_luasnip",

		-- 'cmp-buffer' me permite autocompletar basado en el contenido del buffer actual.
		"hrsh7th/cmp-buffer",

		-- 'cmp-path' me permite autocompletar rutas de archivos y directorios.
		"hrsh7th/cmp-path",
	},
	config = function()
		-- Aquí comienza la configuración del sistema de autocompletado (nvim-cmp).
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			snippet = {
				expand = function(args)
					-- Uso LuaSnip para expandir snippets cuando se seleccionan en el menú de autocompletado.
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = {
				-- Configuro el mapeo de teclas para el autocompletado.
				-- Presionar Enter (`<CR>`) selecciona la opción actual en el menú de autocompletado.
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Configuro el comportamiento de la tecla Tab (`<Tab>`).
				-- Si el menú de autocompletado está visible, navego a la siguiente opción.
				-- Si no está visible, uso el comportamiento por defecto de Tab.
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					else
						fallback()
					end
				end, { "i", "s" }),

				-- Configuro el comportamiento de la tecla Shift+Tab (`<S-Tab>`).
				-- Si el menú de autocompletado está visible, navego a la opción anterior.
				-- Si no está visible, uso el comportamiento por defecto de Shift+Tab.
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					else
						fallback()
					end
				end, { "i", "s" }),
			},
			sources = cmp.config.sources({
				-- Aquí defino las fuentes de autocompletado.
				{ name = "nvim_lsp" }, -- Autocompletado basado en el LSP.
				{ name = "luasnip" }, -- Autocompletado de snippets.
				{ name = "buffer" }, -- Autocompletado basado en el contenido del buffer.
				{ name = "path" }, -- Autocompletado de rutas de archivos.
			}),
		})

		-- Configuro un evento que se activa cuando un LSP se adjunta a un buffer (archivo abierto).
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- Defino una función auxiliar para crear mapeos de teclas específicos para el LSP.
				local map = function(keys, func, desc, mode)
					mode = mode or "n" -- Por defecto, uso el modo normal.
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Mapeo para ir a la definición del símbolo bajo el cursor.
				-- Presiono `gd` para ir a la definición del símbolo.
				map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

				-- Mapeo para encontrar las referencias del símbolo bajo el cursor.
				-- Presiono `gr` para ver todas las referencias del símbolo.
				map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

				-- Mapeo para renombrar la variable bajo el cursor.
				-- Presiono `<leader>rn` (normalmente `<Space>rn`) para renombrar la variable.
				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

				-- Mapeo para ejecutar una acción de código (como arreglar un error o refactorizar).
				-- Presiono `<leader>ca` (normalmente `<Space>ca`) para ver las acciones disponibles.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

				-- Mapeo para ir a la declaración del símbolo bajo el cursor.
				-- Presiono `gD` para ir a la declaración del símbolo.
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			end,
		})

		-- Configuro las capacidades adicionales del LSP proporcionadas por nvim-cmp.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- Defino los LSPs que quiero habilitar.
		local servers = {
			-- LSP para Java (jdtls).
			jdtls = {},
			-- LSP para Python (ruff).
			ruff = {},
			-- LSP para Rust (rust_analyzer).
			rust_analyzer = {},
			-- LSP para SQL (sqlls).
			sqlls = {},
		}

		-- Configuro Mason para que gestione la instalación de los LSPs.
		require("mason").setup()

		-- Defino una lista de herramientas adicionales que quiero asegurar que estén instaladas.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Formateador para Lua.
			"black", -- Formateador para Python.
			"rustfmt", -- Formateador para Rust.
			"prettier", -- Formateador para JavaScript, TypeScript, CSS, etc.
			"sqlfmt", -- Formateador para SQL.
			"google-java-format", -- Formateador para Java (sigue el estilo de Google).
			"checkstyle", -- Herramienta de análisis de código para Java (verifica el estilo y calidad del código).
		})

		-- Configuro 'mason-tool-installer' para que instale automáticamente las herramientas definidas.
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		-- Configuro los LSPs usando 'mason-lspconfig'.
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- Añado las capacidades adicionales de autocompletado al LSP.
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					-- Configuro el LSP con las opciones definidas.
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
