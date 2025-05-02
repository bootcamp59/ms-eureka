#!/bin/sh
set -e

echo "Esperando que config-server esté listo y tenga propiedades para 'ms-eureka' con perfil 'dev'..."

until curl -sf http://config-server:8888/ms-eureka/dev | grep -q "propertySources"; do
  echo "Config Server aún no disponible... esperando 10s"
  sleep 10
done

echo "Config Server listo. Iniciando Eureka..."

exec java -jar /app/app.jar
