docker-minecraft
================

Intended to provide a complete method for deploying minecraft servers. Currently a work in progress. Branches will be available for versions of vanilla, bukkit and spigot from MC version 1.7.10 onwards. Easy method for configuring server for deployment including a configuration wizard and deployment descriptors.

Forking advice
==============

If you need a custom image (perhaps with a preinstalled set of plugins) the recomended method for achieving this is to fork this repository, then add the files under 'usr/local/share/minecraft/defaults/'. Any files in this directory, are copied to the root of the minecraft server install, so for example: if you wanted to add Essentials for all installs, then you could add Essentials.jar to 'usr/local/share/minecraft/defaults/plugins/Essentials.jar'
