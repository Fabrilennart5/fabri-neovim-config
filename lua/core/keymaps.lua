-- Establezco la tecla líder para facilitar la creación de atajos personalizados
vim.g.mapleader = ' '  -- Defino la tecla líder como espacio para que los atajos sean más rápidos y fáciles de recordar
vim.g.maplocalleader = ' '  -- También defino la tecla líder local como espacio para configuraciones locales

-- Desactivo el comportamiento predeterminado de la barra espaciadora en los modos Normal y Visual
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })  
-- Esto asegura que la barra espaciadora no haga nada por defecto, dejándola libre para usarla como tecla líder

-- Defino opciones comunes para mis mapeos de teclas
local opts = { noremap = true, silent = true }  
-- Uso `noremap` para evitar remapeos recursivos y `silent` para evitar mensajes innecesarios al ejecutar los comandos

-- Guardar archivo
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)  
-- Uso Ctrl + S para guardar rápidamente el archivo actual sin necesidad de escribir `:w`

-- Guardar archivo sin autoformateo
vim.keymap.set('n', '<leader>sn', '<cmd>noautocmd w <CR>', opts)  
-- Uso <leader> + sn para guardar el archivo sin activar comandos automáticos, útil si no quiero que se aplique autoformato

-- Cerrar archivo
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', opts)  
-- Uso Ctrl + Q para cerrar el archivo actual rápidamente, equivalente a `:q`

-- Navegación entre buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)  
-- Uso Tab para moverme rápidamente al siguiente buffer abierto
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)  
-- Uso Shift + Tab para moverme al buffer anterior
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', opts)  
-- Uso <leader> + x para cerrar el buffer actual sin confirmar, útil cuando quiero limpiar buffers abiertos rápidamente
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', opts)  
-- Uso <leader> + b para crear un nuevo buffer vacío, ideal para tomar notas rápidas o empezar un nuevo archivo

-- Gestión de ventanas (splits)
vim.keymap.set('n', '<leader>v', '<C-w>v', opts)  
-- Uso <leader> + v para dividir la ventana verticalmente, útil para trabajar con varios archivos lado a lado
vim.keymap.set('n', '<leader>h', '<C-w>s', opts)  
-- Uso <leader> + h para dividir la ventana horizontalmente, ideal cuando necesito ver más líneas de código a la vez
vim.keymap.set('n', '<leader>se', '<C-w>=', opts)  
-- Uso <leader> + se para igualar automáticamente el tamaño de todas las ventanas divididas, manteniendo un diseño limpio
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts)  
-- Uso <leader> + xs para cerrar la ventana actual sin afectar a las demás

-- Navegación entre divisiones (splits)
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)  
-- Uso Ctrl + K para moverme a la división superior, útil cuando trabajo con múltiples ventanas divididas
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)  
-- Uso Ctrl + J para moverme a la división inferior
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)  
-- Uso Ctrl + H para moverme a la división izquierda
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)  
-- Uso Ctrl + L para moverme a la división derecha

-- Gestión de pestañas (tabs)
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts)  
-- Uso <leader> + to para abrir una nueva pestaña vacía, ideal cuando quiero trabajar en un nuevo archivo sin cerrar otros
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts)  
-- Uso <leader> + tx para cerrar rápidamente la pestaña actual
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts)  
-- Uso <leader> + tn para ir a la siguiente pestaña abierta
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts)  
-- Uso <leader> + tp para ir a la pestaña anterior

-- Alternar ajuste de líneas (line wrapping)
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)  
-- Uso <leader> + lw para activar o desactivar el ajuste de líneas largas según lo necesite

-- Mantener lo último copiado al pegar en modo visual 
vim.keymap.set('v', 'p', '"_dP', opts)  
-- Al pegar sobre una selección en modo visual, evito sobrescribir lo que tengo copiado en el registro

-- Mapeos de diagnóstico (diagnostics)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Ir al mensaje de diagnóstico anterior' })  
-- Me muevo al mensaje de diagnóstico anterior (útil al revisar errores o advertencias del código)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Ir al mensaje de diagnóstico siguiente' })  
-- Me muevo al siguiente mensaje de diagnóstico 
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Abrir mensaje de diagnóstico flotante' })  
-- Abro un mensaje flotante con información detallada sobre un diagnóstico específico 
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Abrir lista de diagnósticos' })  
-- Abro una lista con todos los diagnósticos actuales en una ventana separada 
