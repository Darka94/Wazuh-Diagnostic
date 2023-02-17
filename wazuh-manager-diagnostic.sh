#!/bin/bash

# Array con los servicios de Wazuh Manager
services=(
    wazuh-manager
    wazuh-api
    wazuh-db
    wazuh-modulesd
    wazuh-clusterd
    wazuh-ruleset
    wazuh-agentd
    wazuh-nginx
    wazuh-elasticsearch
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
