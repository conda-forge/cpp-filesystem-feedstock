@echo on

mkdir build
cd build

cmake -G Ninja ^
    %CMAKE_ARGS% ^
    -D BUILD_TESTS=OFF ^
    -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D GHC_FILESYSTEM_BUILD_TESTING=OFF ^
    -D GHC_FILESYSTEM_BUILD_EXAMPLES=OFF ^
    %SRC_DIR%
if errorlevel 1 exit 1

cmake --build .
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1