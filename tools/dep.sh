#!/bin/bash

set -e

apt-get update
#apt-get install -y       \
#    libcurl4-openssl-dev \
#    libharfbuzz-dev      \
#    libfribidi-dev       \
#    libfontconfig1-dev   \
#    build-essential      \
#    cmake                \
#    libopenblas-dev      \
#    liblapack-dev        \
#    libarpack2-dev       \
#    libsuperlu-dev       \
#    libgsl-dev           \
#    libarmadillo-dev     \
#    libeigen3-dev

# freetype2
apt-get install -y   \
    libfreetype6-dev \
    libpng-dev       \
    libtiff5-dev     \
    libjpeg-dev
 