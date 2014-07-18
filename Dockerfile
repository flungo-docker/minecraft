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

# Add Minecraft User
RUN useradd -d /home/${MC_USER} -m ${MC_USER} -u 1000

# Setup server directory
RUN mkdir /srv/minecraft
WORKDIR /srv/minecraft

# Download minecraft
RUN wget -qO minecraft_server.jar "https://s3.amazonaws.com/Minecraft.Download/versions/${MC_VERSION}/minecraft_server.${MC_VERSION}.jar"

# Add files
ADD start.sh /srv/minecraft/start.sh

# Set permissions
RUN chown -R ${MC_USER}:${MC_USER} .

# Expose minecraft port
EXPOSE 25565

# Run the server as the minecraft user
USER 1000
ENTRYPOINT ./start.sh
