#!/bin/bash
patch_num="220"
WORKSPACE=${PWD}

_main_func_ () {
    if [ -d "tmp" ]; then 
       rm -Rf tmp;
    fi

    mkdir tmp && cd tmp
    git clone --branch feature git@github.com:cloudrural/cnu_test.git
    cd cnu_test
    git checkout master
    n=1
    while IFS= read -r line || [ -n "$line" ]; do
    git checkout feature "$line"
    n=$((n+1))
    done < ${WORKSPACE}/Patch_File_List.txt
    git commit -m "Patch-$patch_number"
    git push origin master
}

_main_func_

if [[ _main_func_ ]] ; then
    echo "Successfully applied the patch from $source_branc to $base_branch. Merging to master......!"
else
   echo "Not Success"
fi

