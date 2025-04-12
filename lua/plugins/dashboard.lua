return {
	"MeanderingProgrammer/dashboard.nvim",
	event = "VimEnter",
	dependencies = {
		{ "MaximilianLloyd/ascii.nvim", dependencies = { "MunifTanjim/nui.nvim" } },
	},
	config = function()
		require("dashboard").setup({
			header = require("ascii").art.text.neovim.sharp,
			directories = {
				"~/.config",
				"~/Documents/notes",
				"~/dev/repos/harpoon-core.nvim",
				"~/dev/repos/dashboard.nvim",
				"~/dev/repos/advent-of-code",
			},
		})
	end,
}
