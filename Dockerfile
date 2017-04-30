FROM ubuntu
RUN apt-get -y update && apt-get -y install apt-utils
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get install -y build-essential
RUN apt-get install -y nasm tree wget curl emacs-nox

