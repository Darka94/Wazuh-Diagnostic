#!/bin/bash

# Array con los servicios de Wazuh Worker
services=(
    wazuh-worker
    wazuh-filebeat
    wazuh-syslog
    wazuh-agent
    wazuh-network
)

# Función para verificar el estado de un servicio y mostrar información relevante
check_service() {
    local service=$1
    local status=$(systemctl is-active $service)
    echo "Servicio: $service"
    echo "Estado: $status"
    echo "Log:"
    journalctl -u $service --no-pager --since "1 hour ago"
    echo "--------------------------------------------------------"
}

# Iterar por cada servicio y verificar su estado
for service in "${services[@]}"; do
    check_service $service
done
