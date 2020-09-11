#!/bin/bash -l

# get latest cifapi

git clone https://github.com/COMCIFS/cif_api cif_api
pushd cif_api
./configure
make

gcc -o cif_syncheck -I./src -L./src/.libs -licuio -lcif src/examples/syncheck.c

chmod a+x cif_syncheck

# run the checks
popd

shopt -s nullglob
for file in ./*.{cif,dic}
do	
if !( LD_LIBRARY_PATH=./cif_api/src/.libs ./cif_api/cif_syncheck $file )
then echo "Failure"; exit 1;
fi
done

