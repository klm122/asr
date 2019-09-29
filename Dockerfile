FROM FROM python:latest

# Execute system update
RUN apt-get update

# Install packages necessary to run EAP
RUN apt-get -y install xmlstarlet
