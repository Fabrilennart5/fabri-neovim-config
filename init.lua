-- Cargamos la configuración de opciones
require("core.options") -- Este archivo contiene la configuración de opciones de Neovim

-- Cargamos la configuración de atajos de teclado
require("core.keymaps") -- Este archivo define los atajos de teclado personalizados para mejorar la productividad

-- [[ Enlace a su repositorio en GitHub: https://github.com/folke/lazy.nvim ]]
-- Definimos la ruta donde se instalará el gestor de plugins `lazy.nvim`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Verificamos si `lazy.nvim` ya está instalado en la ruta especificada
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	-- URL del repositorio de `lazy.nvim`
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	-- Clonamos el repositorio de `lazy.nvim` si no está instalado
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })

	-- Comprobamos si hubo un error durante la clonación
	if vim.v.shell_error ~= 0 then
		error("Error al clonar lazy.nvim:\n" .. out) -- Mostramos un mensaje de error si falla
	end
end

-- Agregamos la ruta del gestor de plugins a la configuración de Neovim
vim.opt.rtp:prepend(lazypath)

-- Inicializamos y configuramos el gestor de plugins `lazy.nvim`
require("lazy").setup({
	require("plugins.oil"),
	require("plugins.gruvbox"),
	require("plugins.transparent"),
	require("plugins.lualine"),
	require("plugins.treesitter"),
	require("plugins.telescope"),
	require("plugins.lsp"),
	require("plugins.autocompletion"),
	require("plugins.gitsigns"),
	require("plugins.blankline"),
	require("plugins.extras"),
	require("plugins.presence"),
	require("plugins.nvimterm"),
	require("plugins.codeium"),
	require("plugins.barbar"),
	require("plugins.cursor"),
	require("plugins.flash"),
	require("plugins.code_runner"),
	require("plugins.diffview"),
	require("plugins.git-messenger"),
	require("plugins.format_on_save"),
	require("plugins.dashboard"),
	require("plugins.dap"),
	require("plugins.comment"),
	require("plugins.dadbod"),
	require("plugins.twilight"),
})
