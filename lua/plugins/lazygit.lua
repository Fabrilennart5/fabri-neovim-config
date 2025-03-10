-- This is a plugin configuration for LazyGit in Neovim
return {
	-- Plugin repository: kdheepak/lazygit.nvim
	"kdheepak/lazygit.nvim",

	-- Set lazy loading to true to load the plugin only when needed
	lazy = true,

	-- Define the commands that will trigger the plugin
	cmd = {
		"LazyGit", -- Opens LazyGit
		"LazyGitConfig", -- Opens LazyGit configuration
		"LazyGitCurrentFile", -- Opens LazyGit for the current file
		"LazyGitFilter", -- Opens LazyGit with filter options
		"LazyGitFilterCurrentFile", -- Opens LazyGit with filter options for the current file
	},

	-- Optional dependency for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim", -- This is a utility library for Neovim
	},

	-- Set a keybinding for LazyGit. It will load the plugin when the keybinding is pressed for the first time.
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }, -- '<leader>lg' will trigger LazyGit
	},
}
