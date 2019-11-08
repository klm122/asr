# Set the base as the nvidia-cuda Docker
FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu14.04

# Create directory for all of the files to go into and cd into it
WORKDIR /app

# Apt-get all needed dependencies
RUN apt-get update
RUN apt-get install -y git wget make gcc python python-pip build-essential curl \
		 cmake libreadline-dev git-core libqt4-dev libjpeg-dev \
		 libpng-dev ncurses-dev imagemagick libzmq3-dev gfortran \
		 unzip gnuplot gnuplot-x11 sudo vim libopencv-dev google-perftools \
		 libgoogle-perftools-dev ffmpeg
RUN apt-get install -y --no-install-recommends libhdf5-serial-dev liblmdb-dev


# Install cuDNN and the dev files for cuDNN
WORKDIR /

# Install needed python packages
RUN pip install --upgrade pip
RUN pip install numpy PILLOW h5py matplotlib scipy tensorflow-gpu==0.12.0rc0
RUN git config --global url.https://github.com/.insteadOf git://github.com/

# Clone git repo
RUN git clone -b master https://github.com/rohitgirdhar/ActionVLAD.git /app/ActionVLAD --recursive
WORKDIR /app/ActionVLAD/

