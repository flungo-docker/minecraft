############################################################
# Dockerfile to build a server to run minecraft
# Based on dockerfile / java
############################################################

FROM mhutter/java

MAINTAINER Fabrizio Lungo <fab@lungo.co.uk>

# Configuration environment settings
ENV MC_USER mc
ENV MC_VERSION 1.7.10
ENV MC_JAVA_ARGS -server -Xms1024M -Xmx1024M -XX:+UseConcMarkSweepGC -XX:+UseParNewGC
ENV MC_ARGS nogui

RUN apt-get update
RUN useradd -d /home/${MC_USER} -m ${MC_USER} -u 1000

RUN mkdir /srv/minecraft
WORKDIR /srv/minecraft

RUN wget -O /srv/minecraft/minecraft_server.jar "https://s3.amazonaws.com/Minecraft.Download/versions/${MC_VERSION}/minecraft_server.${MC_VERSION}.jar"

ADD start.sh /srv/minecraft/start.sh

RUN chown -R ${MC_USER}:${MC_USER} /srv/minecraft

EXPOSE 25565
USER 1000
ENTRYPOINT java ${MC_JAVA_ARGS} -jar /srv/minecraft/minecraft_server.jar ${MC_ARGS}
