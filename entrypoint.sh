#!/bin/bash -l

# get latest cifapi

git clone https://github.com/COMCIFS/cif_api cif_api
cd cif_api
./configure
make

gcc -o cif_syncheck -I./src -licuio src/examples/syncheck.c src/.libs/libcif.so.1

chmod a+x cif_syncheck

# run the checks

./cif_syncheck $1

