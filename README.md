# simple-python-pyinstaller-app

This a fork of [Build a Python app with PyInstaller](https://jenkins.io/doc/tutorials/build-a-python-app-with-pyinstaller/) tutorial in the [Jenkins User Documentation](https://jenkins.io/doc/).

Moved the jenkins file to top level so jenkins would find something.
Added a docker file and some notes.
Made folders for jenkins-data/  jenkins-docker-certs/  jenkins-home/ 
Made a shell script (run.sh) to build and run.

gave up on this as too complicated.
now persuing https://www.jenkins.io/blog/2020/05/11/docker-windows-agents/
but maybe i can just run jenkins on each machine?

tried something like that but ran into the absolute path problem.
so working back here now. 
this folder does have the sppi app, but i am not working in that yet.
just using run.bat to run dind and jj with blue ocean.
now running up agains the no client certs problem.



