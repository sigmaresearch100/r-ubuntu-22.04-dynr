#!/bin/bash

set -e

sudo apt-get update
sudo apt-get install -y            \
    libcurl4-openssl-dev           \
    libharfbuzz-dev libfribidi-dev \
    libfontconfig1-dev
