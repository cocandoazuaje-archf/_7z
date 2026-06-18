#!/bin/bash

# ==========================================================
# GIT PUSH AUTOMÁTICO CON VALIDACIÓN DE REMOTO
#
# Descripción:
#   - Muestra el remoto configurado (origin)
#   - Solicita confirmación
#   - Ejecuta git add .
#   - Ejecuta git commit -m
#   - Ejecuta git push
#
# Uso:
#   ./gitpush.sh "Mensaje del commit"
#
# Ejemplo:
#   ./gitpush.sh "Corrige servlet canales"
# ==========================================================


# -----------------------------------
# Validar parámetros
# -----------------------------------
if [ $# -eq 0 ]; then

    echo ""
    echo "ERROR: Falta el mensaje del commit."
    echo ""
    echo ""
echo "====================================="
echo "REMOTO CONFIGURADO"
echo "====================================="

git remote -v

    echo "Uso:"
    echo "    ./gitpush.sh \"Mensaje del commit\""

    echo ""
    echo "Ejemplos:"
    echo "    ./gitpush.sh \"Corrige bug\""
    echo "    ./gitpush.sh \"Actualiza frontend\""
    echo ""

    exit 1

fi


MENSAJE="$1"


if [ $? -ne 0 ]; then

    echo ""
    echo "ERROR: No parece ser un repositorio Git."
    echo ""

    exit 1

fi


echo ""
read -p "¿Continuar con add + commit + push? (s/n): " RESP


if [[ ! "$RESP" =~ ^[sS]$ ]]; then

    echo ""
    echo "Operación cancelada."
    echo ""

    exit 0

fi


# -----------------------------------
# Git Add
# -----------------------------------
echo ""
echo "====================================="
echo "Ejecutando: git add ."
echo "====================================="

git add .

if [ $? -ne 0 ]; then

    echo "ERROR en git add"

    exit 1

fi


# -----------------------------------
# Git Commit
# -----------------------------------
echo ""
echo "====================================="
echo "Ejecutando commit"
echo "====================================="

git commit -m "$MENSAJE"

if [ $? -ne 0 ]; then

    echo "ERROR en git commit"

    exit 1

fi


# -----------------------------------
# Git Push
# -----------------------------------
echo ""
echo "====================================="
echo "Ejecutando push"
echo "====================================="

git push

if [ $? -ne 0 ]; then

    echo "ERROR en git push"

    exit 1

fi


echo ""
echo "====================================="
echo "FINALIZADO CORRECTAMENTE"
echo "====================================="
echo ""
