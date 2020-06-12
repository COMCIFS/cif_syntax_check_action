#!/bin/bash -l

# get latest cifapi

git clone https://github.com/COMCIFS/cif_api cif_api
cd cif_api
./configure
make

gcc -o cif_syncheck -I./src -L./src/.libs -licuio -lcif src/examples/syncheck.c

chmod a+x cif_syncheck

# run the checks

LD_LIBRARY_PATH=./src/.libs ./cif_syncheck $1

