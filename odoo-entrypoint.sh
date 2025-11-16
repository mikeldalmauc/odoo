#!/bin/bash
set -e

# 1. Esperar a que PostgreSQL esté accesible
echo "Esperando a que PostgreSQL esté disponible en $DB_HOST:$DB_PORT..."
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
  sleep 2
done
echo "PostgreSQL está listo."

# 2. Comprobar si la base ya está inicializada
echo "Comprobando si la base $DB_NAME ya tiene los módulos base..."
if psql -h "$DB_HOST" -U "$DB_USER" -d "$DB_NAME" -c "SELECT 1 FROM ir_module_module LIMIT 1;" >/dev/null 2>&1; then
  echo "La base $DB_NAME ya está inicializada."
else
  echo "Inicializando la base $DB_NAME con el módulo base..."
  # Para forzar la instalación de `base` solo si aún no existe
  odoo -d "$DB_NAME" -i base --stop-after-init 
  # \ --without-demo=all
fi

# 3. Arrancar Odoo normalmente
echo "Arrancando Odoo..."
exec odoo "$@"
