-- Este archivo se encarga de configurar las opciones básicas de Neovim.

-------------------------------------------------------------------------------
-- Sección 1: Configuración de la interfaz de usuario
-------------------------------------------------------------------------------

-- Numeración de líneas
vim.wo.number = true -- Muestra el número absoluto de la línea actual en el margen izquierdo
vim.o.relativenumber = true -- Muestra los números de línea relativos a la posición del cursor
vim.o.numberwidth = 4 -- Ancho fijo para mostrar números de línea (4 caracteres)

-- Resaltado de la línea actual
vim.o.cursorline = true -- Resaltar la línea actual

-- Columnas de signos (para errores, advertencias, etc.)
vim.wo.signcolumn = "yes" -- Siempre mostrar la columna de signos a la izquierda

-- Menú emergente y autocompletado
vim.o.pumheight = 10 -- Altura máxima del menú emergente para autocompletado
vim.o.completeopt = "menuone,noselect" -- Mejora cómo se muestra el menú emergente durante el autocompletado
vim.opt.shortmess:append("c") -- No mostrar mensajes sobre completado durante inserción

-- Modo actual
vim.o.showmode = true -- Muestra el modo actual en la parte inferior (por ejemplo, -- INSERT --)

-- Pestañas
vim.o.showtabline = 2 -- Mostrar siempre las pestañas, no solo cuando hay más de una

-- Colores en terminales compatibles
vim.opt.termguicolors = true -- Permite el uso de grupos de resaltado con colores (necesario para temas)

-------------------------------------------------------------------------------
-- Sección 2: Configuración de búsqueda y resaltado
-------------------------------------------------------------------------------

-- Búsqueda sin distinguir mayúsculas y minúsculas
vim.o.ignorecase = true -- Las búsquedas no diferencian entre mayúsculas y minúsculas

-- Búsqueda inteligente
vim.o.smartcase = true -- Si hay mayúsculas en la búsqueda, se activará la distinción entre mayúsculas y minúsculas

-- Resaltado en búsquedas
vim.o.hlsearch = true -- Resaltar coincidencias de búsqueda (poner en false para desactivar)

-------------------------------------------------------------------------------
-- Sección 3: Configuración de indentación y edición
-------------------------------------------------------------------------------

-- Indentación automática
vim.o.autoindent = true -- Mantiene la indentación de la línea anterior al crear una nueva
vim.o.smartindent = true -- Mejora el comportamiento de indentación según el contexto del código

-- Espacios y Tabs
vim.o.shiftwidth = 4 -- Número de espacios insertados para cada nivel de indentación
vim.o.tabstop = 4 -- Cada Tab se considera como 4 espacios
vim.o.softtabstop = 4 -- Número de espacios que cuenta un Tab durante la edición
vim.o.expandtab = true -- Al presionar Tab, se insertan espacios en lugar de un carácter Tab

-- Ajuste de líneas largas
vim.o.breakindent = true -- Permite que las líneas largas se ajusten con sangría adicional

-- Backspace
vim.o.backspace = "indent,eol,start" -- Permite usar Backspace para eliminar indentaciones, saltos de línea y al inicio

-------------------------------------------------------------------------------
-- Sección 4: Configuración de ventanas y divisiones
-------------------------------------------------------------------------------

-- Divisiones horizontales y verticales
vim.o.splitbelow = true -- Todas las divisiones horizontales se abrirán debajo de la ventana actual
vim.o.splitright = true -- Todas las divisiones verticales se abrirán a la derecha de la ventana actual

-- Líneas visibles alrededor del cursor
vim.o.scrolloff = 4 -- Número mínimo de líneas visibles por encima y por debajo del cursor
vim.o.sidescrolloff = 8 -- Número mínimo de columnas visibles a los lados del cursor

-------------------------------------------------------------------------------
-- Sección 5: Configuración de archivos y respaldos
-------------------------------------------------------------------------------

-- Archivos de respaldo y swap
vim.o.swapfile = false -- Desactiva la creación de archivos temporales durante la edición
vim.o.backup = false -- Desactiva la creación de archivos de respaldo
vim.o.writebackup = false -- Permite editar un archivo incluso si otro programa lo está utilizando

-- Historial de deshacer cambios
vim.o.undofile = true -- Guarda el historial deshecho entre sesiones

-- Codificación de archivos
vim.o.fileencoding = "utf-8" -- Codificación utilizada al guardar archivos

-------------------------------------------------------------------------------
-- Sección 6: Configuración de rendimiento y tiempos
-------------------------------------------------------------------------------

-- Tiempos de actualización
vim.o.updatetime = 250 -- Tiempo en milisegundos antes de actualizar (más rápido)
vim.o.timeoutlen = 300 -- Tiempo máximo en milisegundos para esperar secuencias mapeadas

-------------------------------------------------------------------------------
-- Sección 7: Configuración avanzada
-------------------------------------------------------------------------------

-- Portapapeles del sistema
vim.o.clipboard = "unnamedplus" -- Copiar/pegar en Neovim interactúa con el portapapeles de Xorg (requiere `xclip` o `xsel`)

-- Separación de plugins entre Vim y Neovim
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Evitar conflictos entre plugins si Vim también está instalado

-- Reconocimiento de palabras con guiones
vim.opt.iskeyword:append("-") -- Incluir guiones como parte de palabras al buscar

-- Línea de comandos
vim.o.cmdheight = 1 -- Altura adicional para mostrar mensajes en la línea de comandosntre plugins si Vim también está instalado
