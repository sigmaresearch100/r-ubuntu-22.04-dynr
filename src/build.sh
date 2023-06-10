#!/bin/bash

set -e

# Makevars in the `arma` branch require the headers in `/usr/local/lib/R/library`

Rscript -e "                                                                                   \
    install.packages(                                                                          \
        package = 'RcppArmadillo',                                                             \
        repos = c(REPO_NAME = 'htps://packagemanager.rstudio.com/all/__linux__/jammy/latest'), \
        lib = '/usr/local/lib/R/library'                                                       \
    )                                                                                          \
"

# roxygen2

Rscript -e "                                              \
    remotes::install_version(                             \
        package = 'roxygen2',                             \
        version = '5.0.1',                                \
        repos = c(CRAN = 'https://cran.rstudio.com')      \
    )                                                     \
"

# tinytex

Rscript -e "                                              \
    try(tinytex::install_tinytex())                       \
"

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
