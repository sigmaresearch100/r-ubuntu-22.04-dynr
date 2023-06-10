#!/bin/bash

set -e

# dynr master

git clone https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"

# dynr arma

git clone -b arma https://github.com/mhunter1/dynr.git
cd dynr
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"

echo -e "\nInstall dynr, done!"
