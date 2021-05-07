#!/bin/sh
docker network create jenkins
mkdir jenkins-data
mkdir jenkins-docker-certs
mkdir jenkins-home
docker rm -f jenkins-docker
docker run --name jenkins-docker --rm --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume "D:\jenkins\jenkins-docker-certs"s:/certs/client \
  --volume "D:\jenkins\jenkins-data":/var/jenkins_home \
  docker:dind
docker build -t myjenkins-blueocean:1.1 .
docker rm -f jenkins-blueocean
docker run --name jenkins-blueocean --rm --detach \
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
  --volume "D:\jenkins\jenkins-data":/var/jenkins_home \
  --volume "D:\jenkins\jenkins-docker-certs":/certs/client:ro \
  --volume "C:\Users\raz":/home \
  --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:1.1

# repository url in pipeline: file:///app
# app is a clone of jenkins/simple-python-pyinstaller-app

# useful: https://git-scm.com/book/en/v2/Git-on-the-Server-The-Protocols

# need both running

#CONTAINER ID   IMAGE                     COMMAND                  CREATED         STATUS         PORTS                                              NAMES
#656d5516f401   myjenkins-blueocean:1.1   "/sbin/tini -- /usr/…"   9 seconds ago   Up 8 seconds   0.0.0.0:8080->8080/tcp, 0.0.0.0:50000->50000/tcp   jenkins-blueocean 
#d602284afaa7   docker:dind               "dockerd-entrypoint.…"   2 minutes ago   Up 2 minutes   2375-2376/tcp   