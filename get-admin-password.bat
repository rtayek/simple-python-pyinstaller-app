#!/bin/sh
docker exec -it myjenkins-blueocean:1.1 cat /var/jenkins_home/secrets/initialAdminPassword
