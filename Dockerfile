############################################################
# Dockerfile to build a server to run minecraft
# Based on dockerfile / java
############################################################

FROM mhutter/java

MAINTAINER Fabrizio Lungo <fab@lungo.co.uk>

# Add Minecraft User
RUN useradd -d /home/mc -m mc -u 1000

# Setup server directory
ADD srv/minecraft/ /srv/minecraft/
WORKDIR /srv/minecraft

# Download minecraft
ENV MC_VERSION 1.7.10
RUN wget -qO minecraft_server.jar "https://s3.amazonaws.com/Minecraft.Download/versions/${MC_VERSION}/minecraft_server.${MC_VERSION}.jar"

# Set permissions
RUN chown -R mc:mc .

# Expose minecraft port
EXPOSE 25565

# Run the server as the minecraft user
USER 1000
ENTRYPOINT ./entrypoint
