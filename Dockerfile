############################################################
# Dockerfile to build a server to run minecraft
# Based on dockerfile / java
############################################################

FROM mhutter/java

MAINTAINER Fabrizio Lungo <fab@lungo.co.uk>

# Add Minecraft User
ENV MC_USER mc
RUN useradd -d /home/${MC_USER} -m ${MC_USER} -u 1000

# Setup server directory
ADD srv/minecraft/ /srv/minecraft/
WORKDIR /srv/minecraft

# Download minecraft
RUN wget -qO minecraft_server.jar "https://dl.bukkit.org/latest-dev/craftbukkit.jar"

# Set permissions
RUN chown -R ${MC_USER}:${MC_USER} .

# Expose minecraft port
EXPOSE 25565

# Run the server as the minecraft user
USER 1000
ENTRYPOINT ./entrypoint
