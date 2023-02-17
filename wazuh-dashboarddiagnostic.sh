#!/bin/bash

# Verificación de permisos de superusuario
if [[ $(id -u) -ne 0 ]]; then
    echo "Este script debe ser ejecutado con permisos de superusuario (root)."
    exit 1
fi

# Verificación de la existencia del archivo de configuración
if [[ ! -f /var/ossec/etc/ossec.conf ]]; then
    echo "No se encontró el archivo de configuración de Wazuh (ossec.conf) en /var/ossec/etc."
    exit 1
fi

# Verificación de la existencia de los directorios de logs
if [[ ! -d /var/ossec/logs ]]; then
    echo "No se encontró el directorio de logs de Wazuh en /var/ossec/logs."
    exit 1
fi

# Verificación de la existencia de los binarios
if [[ ! -x /var/ossec/bin/ossec-control ]]; then
    echo "No se encontró el binario de control de Wazuh en /var/ossec/bin/ossec-control."
    exit 1
fi

# Verificación de la existencia de los servicios
if [[ ! $(systemctl list-unit-files | grep wazuh) ]]; then
    echo "No se encontraron servicios de Wazuh en el sistema."
    exit 1
fi

# Función para verificar el estado de un servicio de Wazuh
check_service_status() {
    echo "Verificando estado de $1..."
    if systemctl is-active --quiet "$1"; then
        echo "    $1 está ejecutándose."
    else
        echo "    $1 NO está ejecutándose."
    fi
}

# Verificación del estado de los servicios
echo "Comprobando el estado de los servicios de Wazuh Dashboard..."
check_service_status wazuh-api
check_service_status wazuh-manager
check_service_status wazuh-worker
check_service_status wazuh-db
check_service_status wazuh-nginx
check_service_status wazuh-modulesd

# Verificación de los logs de los servicios
echo ""
echo "Comprobando los logs de los servicios de Wazuh Dashboard..."
tail /var/ossec/logs/api.log
tail /var/ossec/logs/manager.log
tail /var/ossec/logs/worker.log
tail /var/ossec/logs/ossec.log
tail /var/log/nginx/error.log
tail /var/ossec/logs/alerts/alerts.json

# Verificación del estado del servicio ossec-remoted
echo ""
echo "Comprobando el estado del servicio ossec-remoted..."
/var/ossec/bin/ossec-control status | grep ossec-remoted

# Verificación de la configuración del servicio ossec-remoted
echo ""
echo "Comprobando la configuración del servicio ossec-remoted..."
cat /var/ossec/etc/ossec.conf | grep -A 2 "<ossec_config>"
cat /var/ossec/etc/ossec.conf | grep -A 2 "<remote>"
cat /var/ossec/etc/ossec.conf | grep -A 2 "<rules>"
cat /var/ossec/etc/ossec.conf | grep -A 2 "<decoder>"
