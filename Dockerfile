############################################################
# Dockerfile to build a server to run minecraft
# Based on dockerfile / java
############################################################

FROM dockerfile/java

MAINTAINER Fabrizio Lungo <fab@lungo.co.uk>

ENV MC_USER mc

RUN apt-get update

RUN useradd -d /home/$MC_USER -m $MC_USER -u 1000

USER 1000
