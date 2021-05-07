# from tutorial to build custom image.
FROM jenkins/jenkins:2.277.2-lts-jdk11
USER root
RUN apt-get update && apt-get install -y apt-transport-https \
       ca-certificates curl gnupg2 \
       software-propertiesrm-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/debian \
       $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce-cli
USER jenkins
# copy the app - assumes the app is the same filder that the sgell script was run in.
COPY simple-python-pyinstaller-app .

RUN jenkins-plugin-cli --plugins "blueocean:1.24.6 docker-workflow:1.26"
