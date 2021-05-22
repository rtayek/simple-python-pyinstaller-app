#!/bin/sh
docker exec -it myjenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
