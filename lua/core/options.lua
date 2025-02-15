-- Este archivo se encarga de configurar las opciones básicas de Neovim.

-- Activamos la numeración absoluta de líneas
vim.wo.number = true -- Muestra el número absoluto de la línea actual en el margen izquierdo

-- Activamos la numeración relativa de líneas
vim.o.relativenumber = true -- Muestra los números de línea relativos a la posición del cursor

-- Usamos el portapapeles del sistema para copiar y pegar
vim.o.clipboard = "unnamedplus" -- Copiar/pegar en Neovim interactúa con el portapapeles de Xorg (requiere `xclip` o `xsel`)

-- Copiamos la indentación de la línea actual al iniciar una nueva línea
-- vim.o.autoindent = true -- Mantiene la indentación de la línea anterior al crear una nueva

-- Búsqueda sin distinguir mayúsculas y minúsculas
vim.o.ignorecase = true -- Las búsquedas no diferencian entre mayúsculas y minúsculas

-- Habilitamos búsqueda inteligente
vim.o.smartcase = true -- Si hay mayúsculas en la búsqueda, se activará la distinción entre mayúsculas y minúsculas

-- Establecemos el número de espacios para la indentación
vim.o.shiftwidth = 4 -- Número de espacios insertados para cada nivel de indentación

-- Definimos cuántos espacios se insertan al presionar Tab
vim.o.tabstop = 4 -- Cada Tab se considera como 4 espacios

-- Configuramos cuántos espacios cuenta un Tab en operaciones de edición
vim.o.softtabstop = 4 -- Número de espacios que cuenta un Tab durante la edición

-- Convertimos los Tabs en espacios
vim.o.expandtab = true -- Al presionar Tab, se insertan espacios en lugar de un carácter Tab

-- Mantenemos líneas visibles alrededor del cursor
vim.o.scrolloff = 4 -- Número mínimo de líneas visibles por encima y por debajo del cursor

-- Mantenemos columnas visibles alrededor del cursor si no hay ajuste
vim.o.sidescrolloff = 8 -- Número mínimo de columnas visibles a los lados del cursor

-- Resaltamos la línea actual
vim.o.cursorline = true -- Resaltar la línea actual

-- Forzamos divisiones horizontales debajo de la ventana actual
vim.o.splitbelow = true -- Todas las divisiones horizontales se abrirán debajo de la ventana actual

-- Forzamos divisiones verticales a la derecha de la ventana actual
vim.o.splitright = true -- Todas las divisiones verticales se abrirán a la derecha de la ventana actual

-- Activamos el resaltado en búsquedas
vim.o.hlsearch = true -- (ponemos en false para quitarlo)

-- Mostramos el modo actual (como -- INSERT --)
vim.o.showmode = true -- Muestra el modo actual en la parte inferior

-- Habilitamos colores en terminales compatibles
vim.opt.termguicolors = true -- Permite el uso de grupos de resaltado con colores (necesario para temas)

-- Establecemos el ancho de columna para números de línea
vim.o.numberwidth = 4 -- Ancho fijo para mostrar números de línea (4 caracteres)

-- Desactivamos la creación de archivos swap
vim.o.swapfile = false -- Si esta en TRUE crea archivos temporales durante la edición

-- Habilitamos indentación inteligente
vim.o.smartindent = true -- Mejora el comportamiento de indentación según el contexto del código

-- Siempre mostramos las pestañas en Neovim
vim.o.showtabline = 2 -- Mostrar siempre las pestañas, no solo cuando hay más de una

-- Permitimos usar Backspace en diferentes contextos
vim.o.backspace = "indent,eol,start" -- Permite usar Backspace para eliminar indentaciones, saltos de línea y al inicio

-- Establecemos la altura del menú emergente
vim.o.pumheight = 10 -- Altura máxima del menú emergente para autocompletado

-- Mantenemos visible la columna de signos (para errores, advertencias, etc.)
vim.wo.signcolumn = "yes" -- Siempre mostrar la columna de signos a la izquierda

-- Establecemos la codificación del archivo a UTF-8
vim.o.fileencoding = "utf-8" -- Codificación utilizada al guardar archivos

-- Aumentamos el espacio en la línea de comandos para mensajes
vim.o.cmdheight = 1 -- Altura adicional para mostrar mensajes en la línea de comandos

-- Habilitamos el ajuste por ruptura (break indent)
vim.o.breakindent = true -- Permite que las líneas largas se ajusten con sangría adicional

-- Reducimos el tiempo entre actualizaciones en Neovim
vim.o.updatetime = 250 -- Tiempo en milisegundos antes de actualizar (más rápido)

-- Establecemos el tiempo máximo para esperar una secuencia mapeada
vim.o.timeoutlen = 300 -- Tiempo máximo en milisegundos para esperar secuencias mapeadas

-- Activamos la creación automática de archivos de respaldo
vim.o.backup = false -- Se crean al guardar cambios

-- Desactivamos el bloqueo cuando otro programa edita un archivo abierto
vim.o.writebackup = false -- Permitir editar un archivo incluso si otro programa lo está utilizando

-- Guardamos el historial de deshacer cambios
vim.o.undofile = true -- Permitir guardar el historial deshecho entre sesiones

-- Mejoramos la experiencia del autocompletado
vim.o.completeopt = "menuone,noselect" -- Mejora cómo se muestra el menú emergente durante el autocompletado

-- Evitamos mensajes innecesarios durante el autocompletado
vim.opt.shortmess:append("c") -- No mostrar mensajes sobre completado durante inserción

-- Reconocemos palabras con guiones como una sola palabra al buscar
vim.opt.iskeyword:append("-") -- Incluir guiones como parte de palabras al buscar

-- Separamos plugins de Vim y Neovim si ambos están instalados
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Evitar conflictos entre plugins si Vim también está instalado
