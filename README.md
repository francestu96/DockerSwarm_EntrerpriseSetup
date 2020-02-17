# DockerSwarm_EntrerpriseSetup

This repo contains all necessary files to setup working Joomla CMS, PhpMyAdmin and Grafana instances.

These are the services available from external through a NGinx reverse proxy.
In the internal network we find our database instance (MariaDB DBMS) and some services for resources monitoring.
In particular we have NodeExporter, CAdvisor and Prometheus, which will be queried by Grafana in order to obtain monitoring info.
The configuration need a Gluster shared filesystem to be distributed on multiple machines, furthermore every one must to have the last build of the used docker images. For these two process there are 2 scripts in this repo which are meant to create the gluster needed structure and to build all needed images.
In this configurationwe focus on HighAvailability feature and because of this it involves 3 replicas for each container.
Finally launch the docker swarm stack by using the docker-compose.yml file to have a working ready-to-use configuration.

Look at "Virtualization and Cloud Computing.pdf" presentation for more details.
