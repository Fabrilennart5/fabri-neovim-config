return {
	"yetone/avante.nvim",
	event = "VeryLazy", -- I load this plugin only when necessary to improve startup time.
	version = false, -- I set this to false to always use the latest code changes instead of a fixed release.

	opts = {
		-- I configure the AI provider (OpenAI in this case).
		provider = "openai",
		openai = {
			endpoint = "https://api.openai.com/v1",
			model = "gpt-4o", -- I specify the model I want to use.
			timeout = 30000, -- I set a 30-second timeout for requests.
			temperature = 0, -- I keep the output deterministic.
			max_tokens = 4096, -- I define the maximum token limit for responses.
		},
	},

	build = "make", -- I compile the plugin from source when installed.
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- Windows alternative.

	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- Required for syntax parsing.
		"stevearc/dressing.nvim", -- Improves UI components.
		"nvim-lua/plenary.nvim", -- Utility functions for Neovim.
		"MunifTanjim/nui.nvim", -- UI framework for Neovim.

		-- Optional dependencies for additional features
		"echasnovski/mini.pick", -- Enables file selection with mini.pick.
		"nvim-telescope/telescope.nvim", -- Adds file selection support via Telescope.
		"hrsh7th/nvim-cmp", -- Enables autocompletion for Avante commands.
		"ibhagwan/fzf-lua", -- Allows file selection with fzf.
		"nvim-tree/nvim-web-devicons", -- Provides icons for UI elements.
		"zbirenbaum/copilot.lua", -- Adds support for Copilot as a provider.

		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy", -- I load this only when needed to optimize performance.
			opts = {
				default = {
					embed_image_as_base64 = false, -- I disable embedding images as base64.
					prompt_for_file_name = false, -- I don't prompt for filenames when pasting images.
					drag_and_drop = {
						insert_mode = true, -- Allows dragging and dropping images in insert mode.
					},
					use_absolute_path = true, -- Required for Windows users.
				},
			},
		},

		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" }, -- I enable support for Markdown and Avante files.
			},
			ft = { "markdown", "Avante" },
		},
	},
}
