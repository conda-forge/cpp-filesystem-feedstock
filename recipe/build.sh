#!/bin/bash

# Isolate the build
mkdir -p .build
cd .build || exit 1

# Call CMake to generate the build files
cmake -G "Ninja" \
      ${CMAKE_ARGS} \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DGHC_FILESYSTEM_BUILD_TESTING=OFF \
      -DGHC_FILESYSTEM_BUILD_EXAMPLES=OFF \
      ${SRC_DIR} \
      || exit 1

# Build and install
ninja install
