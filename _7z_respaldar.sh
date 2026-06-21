# =====================================================
# CREAR ARCHIVO 7Z USANDO LAS RUTAS DEFINIDAS EN lista.txt
#
# Descripción:
#   - Lee todas las rutas contenidas en lista.txt
#   - Crea el archivo comprimido respaldo.7z
#   - Conserva la estructura indicada en el archivo
#
# Requisitos:
#   - Tener instalado 7-Zip (7z)
#   - Tener un archivo lista.txt con una ruta por línea
#
# Ejemplo de lista.txt:
#   proyecto/index.html
#   proyecto/js/app.js
#   proyecto/img/logo.png
#
# Salida:
#   respaldo.7z
# =====================================================

# 7z a \
#     respaldo.7z \
#     @lista.txt

# if grep -q '#' lista.txt; then
#     echo "Se encontró # en lista.txt. No se ejecuta 7z."
# else
#     echo "Ejecutando compresión..."
#     7z a respaldo.7z @lista.txt
# fi

grep -v '^#' lista.txt > lista_limpia.txt
7z a respaldo.7z @lista_limpia.txt

./_7z_listar.sh
