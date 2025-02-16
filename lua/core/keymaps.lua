-------------------------------------------------------------------------------
-- Configuración de la tecla líder
-------------------------------------------------------------------------------

-- Defino la tecla líder como espacio para facilitar la creación de atajos personalizados.
-- La tecla líder es una tecla especial que se usa como prefijo para atajos personalizados.
vim.g.mapleader = " "
vim.g.maplocalleader = " " -- También defino la tecla líder local como espacio.

-- Desactivo el comportamiento predeterminado de la barra espaciadora en los modos Normal y Visual.
-- Esto asegura que la barra espaciadora no haga nada por defecto, dejándola libre para usarla como tecla líder.
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Defino opciones comunes para mis mapeos de teclas.
-- `noremap` evita remapeos recursivos, y `silent` evita mensajes innecesarios al ejecutar comandos.
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------------
-- Mapeos básicos de edición y gestión de archivos
-------------------------------------------------------------------------------

-- Guardar archivo
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)
-- Uso Ctrl + S para guardar rápidamente el archivo actual sin necesidad de escribir `:w`.

-- Cerrar archivo
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)
-- Uso Ctrl + Q para cerrar el archivo actual rápidamente, equivalente a `:q`.

-------------------------------------------------------------------------------
-- Mapeos para la gestión de buffers
-------------------------------------------------------------------------------

-- Navegación entre buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
-- Usa Tab para moverte rápidamente al siguiente buffer abierto.

vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
-- Usa Shift + Tab para moverte al buffer anterior.

-- Cerrar buffer actual
vim.keymap.set("n", "<leader>bd", ":bdelete!<CR>", opts)
-- Usa <leader> + bd (buffer delete) para cerrar el buffer actual sin confirmar.

-- Crear un nuevo buffer vacío
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", opts)
-- Usa <leader> + bn (buffer new) para crear un nuevo buffer vacío.

-------------------------------------------------------------------------------
-- Mapeos para la gestión de ventanas (splits)
-------------------------------------------------------------------------------

-- Dividir ventanas
vim.keymap.set("n", "<leader>vw", "<C-w>v", opts)
-- Usa <leader> + vw (vertical window) para dividir la ventana verticalmente.

vim.keymap.set("n", "<leader>hw", "<C-w>s", opts)
-- Usa <leader> + hw (horizontal window) para dividir la ventana horizontalmente.

-- Igualar tamaño de ventanas
vim.keymap.set("n", "<leader>we", "<C-w>=", opts)
-- Usa <leader> + we (window equalize) para igualar el tamaño de todas las ventanas.

-- Cerrar ventana actual
vim.keymap.set("n", "<leader>wc", ":close<CR>", opts)
-- Usa <leader> + wc (window close) para cerrar la ventana actual.

-- Ajustar tamaño de ventanas con flechas usando <leader>
vim.keymap.set("n", "<leader><Up>", ":resize -2<CR>", opts)
-- Usa <leader> + Flecha Arriba para disminuir el tamaño vertical de la ventana actual en 2 líneas.

vim.keymap.set("n", "<leader><Down>", ":resize +2<CR>", opts)
-- Usa <leader> + Flecha Abajo para aumentar el tamaño vertical de la ventana actual en 2 líneas.

vim.keymap.set("n", "<leader><Left>", ":vertical resize -2<CR>", opts)
-- Usa <leader> + Flecha Izquierda para disminuir el ancho horizontal de la ventana actual en 2 columnas.

vim.keymap.set("n", "<leader><Right>", ":vertical resize +2<CR>", opts)
-- Usa <leader> + Flecha Derecha para aumentar el ancho horizontal de la ventana actual en 2 columnas.

-- Navegación entre divisiones (splits)
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
-- Usa Ctrl + K para moverte a la división superior.

vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
-- Usa Ctrl + J para moverte a la división inferior.

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
-- Usa Ctrl + H para moverte a la división izquierda.

vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)
-- Usa Ctrl + L para moverte a la división derecha.

-------------------------------------------------------------------------------
-- Mapeos para la gestión de pestañas (tabs)
-------------------------------------------------------------------------------

-- Crear nueva pestaña
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", opts)
-- Usa <leader> + tn (tab new) para abrir una nueva pestaña vacía.

-- Navegar entre pestañas
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
-- Usa <leader> + tn (tab next) para ir a la siguiente pestaña.

vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)
-- Usa <leader> + tp (tab previous) para ir a la pestaña anterior.

-------------------------------------------------------------------------------
-- Mapeos para diagnóstico (diagnostics)
-------------------------------------------------------------------------------

-- Navegar entre mensajes de diagnóstico
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al mensaje de diagnóstico anterior" })
-- Me muevo al mensaje de diagnóstico anterior (útil al revisar errores o advertencias del código).

vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al mensaje de diagnóstico siguiente" })
-- Me muevo al siguiente mensaje de diagnóstico.

-- Abrir mensaje de diagnóstico flotante
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Abrir mensaje de diagnóstico flotante" })
-- Abro un mensaje flotante con información detallada sobre un diagnóstico específico.

-- Abrir lista de diagnósticos
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Abrir lista de diagnósticos" })
-- Abro una lista con todos los diagnósticos actuales en una ventana separada.
