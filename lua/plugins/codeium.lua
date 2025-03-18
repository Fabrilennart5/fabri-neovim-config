-- Este es el plugin de Codeium, una herramienta de autocompletado impulsada por IA.
-- Lo estoy configurando aquí para integrarlo con Neovim.
return {
	"Exafunction/codeium.nvim", -- Especifico el repositorio del plugin en GitHub.
	dependencies = { -- Defino las dependencias que necesita Codeium para funcionar correctamente.
		"nvim-lua/plenary.nvim", -- Plenary es una librería útil para Neovim que proporciona funciones comunes.
		"hrsh7th/nvim-cmp", -- nvim-cmp es un plugin de autocompletado que Codeium utiliza para integrarse.
	},
	config = function() -- Aquí configuro Codeium una vez que se haya cargado.
		require("codeium").setup({ -- Llamo a la función de configuración de Codeium.
			-- Puedo agregar opciones personalizadas aquí si es necesario.
			-- Por ahora, lo dejo con la configuración predeterminada.
		})
	end,
}
