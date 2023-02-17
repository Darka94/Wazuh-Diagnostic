#!/bin/bash
#Logo
echo"#     #                                ######                                                      ";
echo"#  #  #   ##   ###### #    # #    #    #     # #   ##    ####  #    #  ####   ####  ##### #  ####";
echo"#  #  #  #  #      #  #    # #    #    #     # #  #  #  #    # ##   # #    # #        #   # #    # ";
echo"#  #  # #    #    #   #    # ######    #     # # #    # #      # #  # #    #  ####    #   # #      ";
echo"#  #  # ######   #    #    # #    #    #     # # ###### #  ### #  # # #    #      #   #   # #      ";
echo"#  #  # #    #  #     #    # #    #    #     # # #    # #    # #   ## #    # #    #   #   # #    # ";
echo"## ##  #    # ######  ####  #    #    ######  # #    #  ####  #    #  ####   ####    #   #  ####  ";
echo "By Matías Marrero";
echo "mmarrero.k@gmail.com";
echo"https://github.com/Darka94";

# Opciones del menú
options=("Diagnosticar Wazuh Manager" "Diagnosticar Wazuh Worker" "Diagnosticar Wazuh Indexer" "Diagnosticar Wazuh Dashboard" "Salir")

# Función para mostrar el menú y obtener la opción seleccionada
show_menu() {
    echo ""
    echo "Seleccione una opción:"
    for i in "${!options[@]}"; do
        echo "$((i+1)). ${options[i]}"
    done
    read -p "Opción: " choice
}

# Ciclo del menú
while true; do
    show_menu

    case $choice in
        1)
            echo "Diagnosticando Wazuh Manager..."
            ./wazuh-manager-diagnostic.sh
            ;;
        2)
            echo "Diagnosticando Wazuh Worker..."
            ./wazuh-worker-diagnostic.sh
            ;;
        3)
            echo "Diagnosticando Wazuh Indexer..."
            ./wazuh-indexer-diagnostic.sh
            ;;
        4)
            echo "Diagnosticando Wazuh Dashboard..."
            ./wazuh-dashboard-diagnostic.sh
            ;;
        5)
            echo "¡Hasta luego!"
            break
            ;;
        *)
            echo "Opción inválida. Intente de nuevo."
            ;;
    esac
done
