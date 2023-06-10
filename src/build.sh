#!/bin/bash

set -e

# Makevars in the `arma` branch require the headers in file.path(Sys.getenv(\'R_HOME\'), \'library\')

#Rscript -e "                                             \
#    install.packages(                                    \
#        'Rcpp',                                          \
#        type = 'source',                                 \
#        lib = file.path(Sys.getenv('R_HOME'), 'library') \
#    )                                                    \
#"

#Rscript -e "                                             \
#    install.packages(                                    \
#        'RcppArmadillo',                                 \
#        type = 'source',                                 \
#        lib = file.path(Sys.getenv('R_HOME'), 'library') \
#    )                                                    \
#"

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
cd src
wget -q https://raw.githubusercontent.com/sigmaresearch100/r-ubuntu-22.04-dynr/main/src/Makevars.in
cd ..
./configure
make clean install
cd ..
rm -rf dynr
Rscript -e "demo('LinearSDE', package = 'dynr')"

echo -e "\nInstall dynr, done!"
