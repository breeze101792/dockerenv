## base image
FROM ubuntu:18.04

## MAINTAINER
MAINTAINER breeze101792@gmail.com
########################################################
###    Accound settings
########################################################
## Add user
#RUN groupadd wheel
#RUN useradd -G wheel -d /home/docker -m docker
#ADD account.conf /home/docker
#RUN chpasswd < /home/docker/account.conf
#RUN rm /home/docker/account.conf

## Add sudo right
## RUN echo "docker  ALL=(ALL)       ALL" >> /etc/sudoers
########################################################
###    Setup User Env
########################################################
#RUN mkdir /home/docker/tools
#ADD tools /home/docker/tools
#RUN ln -sf /home/docker/tools/vimrc /home/docker/.vimrc
#RUN echo "source /home/docker/tools/bashrc >> /home/docker/.bashrc"
#######################################################
##    System settings
#######################################################
ADD build /root/tools
RUN bash /root/tools/setup.sh --ubuntu --user docker
RUN bash /root/tools/experiment.sh

#######################################################
##    Finalize Docker Setting
#######################################################
USER docker
WORKDIR /home/docker
ENV USER docker

