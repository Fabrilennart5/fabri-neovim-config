# Mi Configuración Personalizada de Neovim

![Captura de pantalla de mi configuración de Neovim](https://pbs.twimg.com/media/GiWCjB5WgAAmXCH?format=jpg&name=large)

Esta es mi configuración personalizada de Neovim, diseñada para maximizar la productividad y ofrecer una experiencia de desarrollo fluida. Utiliza una combinación de plugins modernos y optimizaciones para crear un entorno de programación eficiente y visualmente atractivo.

---

## Características Principales

### Interfaz y Estilo
- **Temas personalizados**: Utilizo el tema `dracula` para un aspecto moderno y agradable a la vista.
- **Barra de estado**: `lualine.nvim` para una barra de estado informativa y minimalista.
- **Efectos visuales**: `flash.nvim` para animaciones y efectos en el cursor, mejorando la experiencia visual.

### Navegación y Gestión de Archivos
- **Explorador de archivos**: `oil.nvim` para una gestión eficiente de archivos y directorios.
- **Gestión de pestañas**: `barbar.nvim` para una navegación fluida entre buffers y pestañas.
- **Búsqueda rápida**: `telescope.nvim` para buscar archivos, texto y más de manera rápida y eficiente.

### Desarrollo y Productividad
- **Autocompletado inteligente**: `nvim-cmp` (configurado en `autocompletion.lua`) para un autocompletado rápido y preciso.
- **Resaltado de sintaxis**: `treesitter` para un análisis y resaltado de código mejorado.
- **Integración con Git**: `gitsigns.nvim` y `diffview.nvim` para ver cambios en tiempo real y gestionar repositorios de manera eficiente.
- **Ejecución de código**: `code_runner.nvim` para ejecutar fragmentos de código directamente desde Neovim.
- **Formateo de código**: `format-on-save.nvim` para guardar el código correctamente formateado.


### Personalización y Extras
- **Transparencia**: `transparent.nvim` para una ventana de Neovim transparente (opcional).
- **Efectos de enfoque**: `twilight.nvim` para resaltar solo la sección de código en la que estás trabajando.
- **Terminal integrada**: `toggleterm.nvim` para una terminal flotante dentro de Neovim.

---

## Plugins Utilizados

Aquí tienes una lista de los plugins principales que forman parte de esta configuración:

- **Interfaz y Estilo**:
  - `dracula.nvim`: Tema visual.
  - `lualine.nvim`: Barra de estado personalizada.
  - `flash.nvim`: Efectos visuales para el cursor.

- **Navegación y Archivos**:
  - `oil.nvim`: Explorador de archivos.
  - `barbar.nvim`: Gestión de buffers y pestañas.
  - `telescope.nvim`: Búsqueda rápida de archivos y texto.

- **Desarrollo**:
  - `nvim-cmp`: Autocompletado inteligente.
  - `treesitter`: Resaltado de sintaxis mejorado.
  - `gitsigns.nvim`: Integración con Git.
  - `diffview.nvim`: Visualización de diferencias en Git.
  - `code_runner.nvim`: Ejecución rápida de código.

- **Extras**:
  - `transparent.nvim`: Ventana transparente.
  - `twilight.nvim`: Efectos de enfoque en el código.
  - `toggleterm.nvim`: Terminal integrada.

---

## Cómo Usar Esta Configuración

1. Clona este repositorio en tu carpeta de configuración de Neovim:
   ```bash
   git clone https://github.com/Fabrilennart5/fabri-neovim-config.git ~/.config/nvim
Asegúrate de tener Neovim instalado (versión 0.9 o superior).

Abre Neovim y los plugins se instalarán automáticamente gracias a lazy.nvim.
