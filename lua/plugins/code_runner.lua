return {
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup({
        filetype = {
          -- Comando para ejecutar archivos Python
          python = "python3 -u $fileName", 
          -- Comando para ejecutar archivos SQL (ajusta según tu entorno)
          sql = "sqlite3 $fileName < $fileName", 
          -- Comando para compilar y ejecutar archivos Java
          java = {
            "cd $dir &&",           -- Cambia al directorio del archivo
            "javac $fileName &&",   -- Compila el archivo Java
            "java $fileNameWithoutExt" -- Ejecuta el archivo compilado
          },
          -- Comando para compilar y ejecutar archivos Rust
          rust = "cargo run --quiet", -- Ejecuta el proyecto Rust en el directorio actual
        },
      })
    end,
  },
}
