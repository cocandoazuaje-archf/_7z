# ==========================================================
# LISTAR CONTENIDO DE respaldo.7z Y CALCULAR TAMAÑO TOTAL
#
# Descripción:
#   - Muestra cada archivo contenido dentro de respaldo.7z
#   - Convierte el tamaño desde bytes a MB
#   - Calcula el tamaño total acumulado
#   - No descomprime el archivo
#
# Requisitos:
#   - Tener instalado 7-Zip (7z)
#   - Tener el archivo respaldo.7z disponible
#
# Salida esperada:
#
#     12.55 MB  js/app.js
#    120.80 MB  backup.sql
#      0.31 MB  index.html
#
#     ----------------------
#     TOTAL: 133.66 MB
# ==========================================================

7z l -slt respaldo.7z | awk '

# Capturar nombre/ruta del archivo
/^Path =/ {

    archivo = substr($0, 8)

}

# Capturar tamaño y convertir a MB
/^Size =/ {

    mb = $3 / 1024 / 1024

    total += mb

    printf "%10.2f MB   %s\n",
           mb,
           archivo

}

# Mostrar total acumulado
END {

    print ""
    print "----------------------"

    printf "TOTAL: %.2f MB\n",
           total

}
'
