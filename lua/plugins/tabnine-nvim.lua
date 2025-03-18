return {
	"codota/tabnine-nvim",
	build = "./dl_binaries.sh", -- Script de construcción para Linux/macOS
	config = function()
		require("tabnine").setup({})
	end,
}
