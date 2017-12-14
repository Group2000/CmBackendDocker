# CmBackendDocker
Docker deploy for Cell Monitor Backend. The backend is used to process and display mobile cell coverage measurements.
Input from the Group 2000 Cell Monitor is processed.

As example the docker-compose.yml file from https://github.com/Group2000/CmBackendDocker/blob/master/docker-compose.yml can be used. Change the volume mapping of the database and the SERVERIP setting of the backend. 

For Elasticsearch the max map count has to be increased on the host system:
Edit /etc/sysctl.conf and add the line: "vm.max_map_count=262144"

Also take not of SELinux, change the setting of the volume directories with "chcon -Rt svirt_sandbox_file_t <directory>"

The web interface runs on the default http port.
