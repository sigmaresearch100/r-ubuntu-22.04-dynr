#!/bin/bash

set -e

mkdir dynr
cd dynr
mkdir src
cd src
touch Makevars.in
wget -q https://raw.githubusercontent.com/sigmaresearch100/r-ubuntu-22.04-dynr/main/src/Makevars.in
cat Makevars.in
