# Wazuh Diagnostic Scripts
Este es un conjunto de scripts para diagnosticar problemas en diferentes servicios de Wazuh.

# Scripts Disponibles
wazuh_manager_diagnostic.sh: este script te ayuda a diagnosticar problemas en los servicios de Wazuh Manager. Verifica el estado de los servicios, los logs, los archivos de configuración y otros aspectos importantes para asegurarse de que todo esté funcionando correctamente.

'wazuh_worker_diagnostic.sh': este script te ayuda a diagnosticar problemas en los servicios de Wazuh Worker. Al igual que el anterior, verifica el estado de los servicios, los logs, los archivos de configuración y otros aspectos importantes para asegurarse de que todo esté funcionando correctamente.

'wazuh_indexer_diagnostic.sh': este script te ayuda a diagnosticar problemas en los servicios de Wazuh Indexer. Verifica el estado de los servicios, los logs, los archivos de configuración y otros aspectos importantes para asegurarse de que todo esté funcionando correctamente.

'wazuh_dashboard_diagnostic.sh': este script te ayuda a diagnosticar problemas en los servicios de Wazuh Dashboard. Verifica el estado de los servicios, los logs, los archivos de configuración y otros aspectos importantes para asegurarse de que todo esté funcionando correctamente.

'wazuh_diagnostic_menu.sh': este script es un menú que llama a los cuatro scripts anteriores. Te permite ejecutar todos los diagnósticos juntos o elegir cuál de ellos quieres ejecutar.

# Cómo utilizar los scripts
Descarga los scripts a la máquina donde se encuentra el servicio que deseas diagnosticar.

Asegúrate de tener permisos de ejecución en cada uno de los scripts. Puedes hacerlo con el comando chmod +x nombre_del_script.sh.

Ejecuta el script correspondiente al servicio que deseas diagnosticar. Por ejemplo, si deseas diagnosticar problemas en Wazuh Manager, ejecuta wazuh_manager_diagnostic.sh.

Sigue las instrucciones en pantalla y revisa los resultados obtenidos.

# Nota importante
Los scripts han sido probados en Wazuh 4.3.10. Si utilizas una versión diferente de Wazuh, es posible que algunos de los comandos o rutas deban ajustarse para que funcionen correctamente.
