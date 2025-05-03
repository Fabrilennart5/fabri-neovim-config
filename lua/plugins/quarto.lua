return {

	{ -- Habilito compatibilidad con Quarto y ejecuto código con slime
		"quarto-dev/quarto-nvim",
		dev = false,
		opts = {
			lspFeatures = {
				enabled = true,
				chunks = "curly",
			},
			codeRunner = {
				enabled = true,
				default_method = "slime",
			},
		},
		dependencies = {
			-- Uso otter para características de lenguaje en bloques de código
			"jmbuhr/otter.nvim",
		},
	},

	{ -- Abro archivos .ipynb como documentos .qmd y los convierto automáticamente
		"GCBallesteros/jupytext.nvim",
		opts = {
			custom_language_formatting = {
				python = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
				r = {
					extension = "qmd",
					style = "quarto",
					force_ft = "quarto",
				},
			},
		},
	},

	{ -- Envío código desde Quarto a una terminal o REPL
		"jpalardy/vim-slime",
		dev = false,
		init = function()
			vim.b["quarto_is_python_chunk"] = false
			Quarto_is_in_python_chunk = function()
				require("otter.tools.functions").is_otter_language_context("python")
			end

			vim.cmd([[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk && !(exists('b:quarto_is_r_mode') && b:quarto_is_r_mode)
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      if exists('b:quarto_is_r_mode') && b:quarto_is_r_mode && b:quarto_is_python_chunk
      return [a:text, "\n"]
      else
      return [a:text]
      end
      end
      endfunction
      ]])

			vim.g.slime_target = "neovim"
			vim.g.slime_no_mappings = true
			vim.g.slime_python_ipython = 1
		end,
		config = function()
			-- Configuro slime para usarlo en Neovim
			vim.g.slime_input_pid = false
			vim.g.slime_suggest_default = true
			vim.g.slime_menu_config = false
			vim.g.slime_neovim_ignore_unlisted = true

			-- Marco terminal activa para enviarle código
			local function mark_terminal()
				local job_id = vim.b.terminal_job_id
				vim.print("job_id: " .. job_id)
			end

			-- Configuro la terminal como destino
			local function set_terminal()
				vim.fn.call("slime#config", {})
			end
			vim.keymap.set("n", "<leader>cm", mark_terminal, { desc = "[m]arcar terminal" })
			vim.keymap.set("n", "<leader>cs", set_terminal, { desc = "[s]eleccionar terminal" })
		end,
	},

	{ -- Inserto imágenes desde el portapapeles en documentos Markdown, Quarto y LaTeX
		"HakonHarnes/img-clip.nvim",
		event = "BufEnter",
		ft = { "markdown", "quarto", "latex" },
		opts = {
			default = {
				dir_path = "img",
			},
			filetypes = {
				markdown = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
				quarto = {
					url_encode_path = true,
					template = "![$CURSOR]($FILE_PATH)",
					drag_and_drop = {
						download_images = false,
					},
				},
			},
		},
		config = function(_, opts)
			require("img-clip").setup(opts)
			vim.keymap.set("n", "<leader>ii", ":PasteImage<cr>", { desc = "insertar imagen del portapapeles" })
		end,
	},

	{ -- Previsualizo ecuaciones matemáticas en línea
		"jbyuki/nabla.nvim",
		keys = {
			{ "<leader>qm", ':lua require"nabla".toggle_virt()<cr>', desc = "mostrar/ocultar ecuaciones" },
		},
	},

	{ -- Ejecuto código en vivo y muestro resultados con Molten
		"benlubas/molten-nvim",
		dev = false,
		enabled = true,
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_image_provider = "image.nvim"
			vim.g.molten_auto_open_output = true
			vim.g.molten_auto_open_html_in_browser = true
			vim.g.molten_tick_rate = 200
		end,
		config = function()
			local init = function()
				local quarto_cfg = require("quarto.config").config
				quarto_cfg.codeRunner.default_method = "molten"
				vim.cmd([[MoltenInit]])
			end
			local deinit = function()
				local quarto_cfg = require("quarto.config").config
				quarto_cfg.codeRunner.default_method = "slime"
				vim.cmd([[MoltenDeinit]])
			end

			-- Atajos para controlar Molten
			vim.keymap.set("n", "<localleader>mi", init, { silent = true, desc = "Iniciar molten" })
			vim.keymap.set("n", "<localleader>md", deinit, { silent = true, desc = "Detener molten" })
			vim.keymap.set("n", "<localleader>mp", ":MoltenImagePopup<CR>", { silent = true, desc = "ver imagen" })
			vim.keymap.set(
				"n",
				"<localleader>mb",
				":MoltenOpenInBrowser<CR>",
				{ silent = true, desc = "abrir en navegador" }
			)
			vim.keymap.set("n", "<localleader>mh", ":MoltenHideOutput<CR>", { silent = true, desc = "ocultar salida" })
			vim.keymap.set(
				"n",
				"<localleader>ms",
				":noautocmd MoltenEnterOutput<CR>",
				{ silent = true, desc = "ver salida" }
			)
		end,
	},
}
