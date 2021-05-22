docker network create jenkins
docker rm -f jenkins-docker
docker run --name jenkins-docker --rm --detach ^
  --privileged --network jenkins --network-alias docker ^
  --env DOCKER_TLS_CERTDIR=/certs ^
  --volume "D:\jenkins\docker\jenkins-home":/var/jenkins_home ^
  --volume "D:\jenkins\docker\jenkins-docker-certs":/certs/client:ro ^
  docker:dind
docker build -t myjenkins-blueocean:1.1 .
docker rm -f myjenkins-blueocean
docker run --name myjenkins-blueocean --rm --detach ^
  --network jenkins --env DOCKER_HOST=tcp://docker:2376 ^
  --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 ^
  --volume "D:\jenkins\docker\jenkins-home":/var/jenkins_home ^
  --volume "D:\jenkins\docker\jenkins-docker-certs":/certs/client:ro ^
  --volume "C:\Users\raz":/home ^
  --publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:1.1
  docker ps


