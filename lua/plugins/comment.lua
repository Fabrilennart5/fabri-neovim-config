-- Este plugin permite agregar y quitar comentarios en cualquier lenguaje
return {
	"numToStr/Comment.nvim",
	opts = {
		-- Agrega un espacio entre el comentario y la línea de código
		padding = true,

		-- Mantiene el cursor en la misma posición después de comentar o descomentar
		sticky = true,

		-- Líneas que serán ignoradas al comentar o descomentar (por defecto, nil = ninguna)
		ignore = nil,

		-- Atajos para alternar comentarios en NORMAL mode
		toggler = {
			-- Alternar comentario en una línea con 'gcc'
			line = "gcc",
			-- Alternar comentario en bloque con 'gbc'
			block = "gbc",
		},

		-- Atajos para comentar en NORMAL y VISUAL mode
		opleader = {
			-- Comentar líneas seleccionadas con 'gc'
			line = "gc",
			-- Comentar bloques seleccionados con 'gb'
			block = "gb",
		},

		-- Atajos adicionales para comentarios
		extra = {
			-- Agregar un comentario en la línea superior con 'gcO'
			above = "gcO",
			-- Agregar un comentario en la línea inferior con 'gco'
			below = "gco",
			-- Agregar un comentario al final de la línea con 'gcA'
			eol = "gcA",
		},

		-- Habilita los atajos de teclado
		mappings = {
			-- Habilita los atajos básicos como 'gcc', 'gbc', 'gc{movimiento}', 'gb{movimiento}'
			basic = true,
			-- Habilita los atajos extra como 'gco', 'gcO', 'gcA'
			extra = true,
		},

		-- Función que se ejecuta antes de comentar o descomentar (puede ser personalizada)
		pre_hook = nil,

		-- Función que se ejecuta después de comentar o descomentar (puede ser personalizada)
		post_hook = nil,
	},
}
