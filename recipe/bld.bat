:: Windows

echo "================= begin ==================="

:: Isolate the build
mkdir build
cd build
if errorlevel 1 exit 1

:: Generate the build files
cmake -G "Ninja" ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DBUILD_TESTS=OFF ^
      -DGHC_FILESYSTEM_BUILD_TESTING=OFF ^
      -DGHC_FILESYSTEM_BUILD_EXAMPLES=OFF ^
      %SRC_DIR%
if errorlevel 1 exit 1

:: Build and install
ninja install
if errorlevel 1 exit 1
