## base image
FROM ubuntu:18.04

## MAINTAINER
MAINTAINER breeze101792@gmail.com

#######################################################
##    Update/Install Basic Package
#######################################################

# Update system
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y sudo python

## Android Require Package
RUN apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
## Lineageos Require Package
RUN apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
RUN apt-get install -y libwxgtk3.0-dev


## use base as sh instead of dash
RUN ln -sf /bin/bash /bin/sh

#######################################################
##    Add/Setting Accound
#######################################################

RUN useradd -d /home/docker -m docker
ADD account.conf /home/docker
RUN chpasswd < /home/docker/account.conf
RUN rm /home/docker/account.conf
RUN echo "docker  ALL=(ALL)       ALL" >> /etc/sudoers

## REPO Settings
RUN mkdir /home/docker/bin
RUN echo "PATH=~/bin:$PATH" >> /home/docker/.bashrc
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /home/docker/bin/repo
RUN chmod a+x /home/docker/bin/repo

## use ccache
RUN apt-get install -y ccache
RUN echo "export USE_CCACHE=1" >> /home/docker/.bashrc
RUN echo "export CCACHE_EXEC=/usr/bin/ccache" >> /home/docker/.bashrc
RUN echo "ccache -M 50G" >> /home/docker/.bashrc
RUN echo "" >> /home/docker/.bashrc

#######################################################
##    Finalize Docker Setting
#######################################################
USER docker
WORKDIR /home/docker
ENV USER docker

