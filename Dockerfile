# Set the base as the nvidia-cuda Docker
FROM ubuntu:latest

# Create directory for all of the files to go into and cd into it

# Apt-get all needed dependencies
RUN apt-get update
RUN apt-get install libatlas-base-dev
