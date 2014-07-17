############################################################
# Dockerfile to build a server to run minecraft
# Based on dockerfile / java
############################################################

FROM dockerfile/java

MAINTAINER Fabrizio Lungo <fab@lungo.co.uk>

RUN apt-get update
