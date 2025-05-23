#!/bin/bash

mkdir build
cd build

cmake -GNinja \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DGHC_FILESYSTEM_BUILD_TESTING=OFF \
    -DGHC_FILESYSTEM_BUILD_EXAMPLES=OFF \
    ${SRC_DIR}
cmake --build . -j ${CPU_COUNT}
cmake --build . --target install
