# Mi Configuración Personalizada de Neovim 🚀

![Captura de pantalla de mi configuración de Neovim](https://pbs.twimg.com/media/Gj7MJ2qXMAA_VEJ?format=jpg&name=large)

Esta es mi configuración personalizada de Neovim, diseñada para maximizar la productividad y ofrecer una experiencia de desarrollo fluida. Utiliza una combinación de plugins modernos y optimizaciones para crear un entorno de programación eficiente y visualmente atractivo. 🎨

---

## 📌 Requisitos

Para utilizar esta configuración, necesitas cumplir con los siguientes requisitos:

1. **Neovim 0.10 o superior** ⚡
   - Asegúrate de tener instalada la versión más reciente de Neovim con el siguiente comando:
     ```bash
     nvim --version
     ```
   - Para actualizar Neovim en sistemas basados en Debian/Ubuntu, usa:
     ```bash
     sudo apt update && sudo apt upgrade -y neovim
     ```
   - Si usas la versión AppImage:
     ```bash
     curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
     chmod u+x nvim.appimage
     sudo mv nvim.appimage /usr/local/bin/nvim
     ```

2. **Compilador de C** 🛠️
   - Algunos plugins requieren compilación. Instala `gcc` en Linux con:
     ```bash
     sudo apt install build-essential
     ```

3. **xclip** 📋
   - Para copiar y pegar desde la terminal, instala `xclip` con:
     ```bash
     sudo apt install xclip
     ```

4. **Git** 📝
   - Para clonar el repositorio y gestionar plugins, instala `git` con:
     ```bash
     sudo apt install git
     ```

---

## 🎨 Características Principales

### 🌟 Interfaz y Estilo
- **Temas personalizados**: `dracula.nvim` para un aspecto moderno.
- **Barra de estado**: `lualine.nvim` para información clara.
- **Efectos visuales**: `flash.nvim` para una experiencia dinámica.

### 📂 Navegación y Gestión de Archivos
- **Explorador de archivos**: `oil.nvim` para una mejor organización.
- **Gestión de pestañas**: `barbar.nvim` para una navegación fluida.
- **Búsqueda rápida**: `telescope.nvim` para encontrar archivos fácilmente.

### 🚀 Desarrollo y Productividad
- **Autocompletado inteligente**: `nvim-cmp`.
- **Resaltado de sintaxis**: `treesitter`.
- **Integración con Git**: `gitsigns.nvim` y `diffview.nvim`.
- **Ejecución de código**: `code_runner.nvim`.
- **Formateo automático**: `format-on-save.nvim`.

### 🎭 Personalización y Extras
- **Transparencia**: `transparent.nvim` (opcional).
- **Efectos de enfoque**: `twilight.nvim`.
- **Terminal integrada**: `toggleterm.nvim`.

---

## 🔌 Plugins Utilizados

Aquí tienes una lista de los plugins principales en esta configuración:

- **Interfaz y Estilo**: `dracula.nvim`, `lualine.nvim`, `flash.nvim`.
- **Navegación**: `oil.nvim`, `barbar.nvim`, `telescope.nvim`.
- **Desarrollo**: `nvim-cmp`, `treesitter`, `gitsigns.nvim`, `diffview.nvim`, `code_runner.nvim`.
- **Extras**: `transparent.nvim`, `twilight.nvim`, `toggleterm.nvim`.

---

## 🛠️ Instalación

1. Clona este repositorio en tu carpeta de configuración de Neovim:
   ```bash
   git clone https://github.com/Fabrilennart5/fabri-neovim-config.git ~/.config/nvim
