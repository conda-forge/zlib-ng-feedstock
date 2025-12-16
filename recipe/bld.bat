@echo on
setlocal EnableDelayedExpansion

echo if( DEFINED ZLIB_SUFFIX ) >> "CMakeLists.txt"
echo     set_target_properties(zlib-ng PROPERTIES SUFFIX ${ZLIB_SUFFIX}) >> "CMakeLists.txt"
echo endif() >> "CMakeLists.txt"
echo if( DEFINED ZLIB_OUTPUT_NAME ) >> "CMakeLists.txt"
echo     set_target_properties(zlib-ng PROPERTIES OUTPUT_NAME ${ZLIB_OUTPUT_NAME}) >> "CMakeLists.txt"
echo endif() >> "CMakeLists.txt"

mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1

:: when building zlib-ng, build the shared library only
:: when building zlib compat, build shared+static -- this is done via not
:: passing any BUILD_SHARED_LIBS value
if %ZLIB_COMPAT%==0 (
      set CMAKE_ARGS=%CMAKE_ARGS% -DBUILD_SHARED_LIBS=1
) else (
      set CMAKE_ARGS=%CMAKE_ARGS% -DZLIB_SUFFIX=".dll"
)

cmake -G "NMake Makefiles" ^
      %CMAKE_ARGS% ^
      -DCMAKE_BUILD_TYPE:STRING="Release" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DWITH_GTEST=OFF ^
      -DZLIB_COMPAT=%ZLIB_COMPAT% ^
      ..

if errorlevel 1 exit 1

cmake --build . --config Release -j%CPU_COUNT%
if errorlevel 1 exit 1

if not "%CONDA_BUILD_SKIP_TESTS%"=="1" (
ctest -C release -j%CPU_COUNT%
)
if errorlevel 1 exit 1

cmake --build . --target install --config Release
if errorlevel 1 exit 1

if %ZLIB_COMPAT%==1 (
      :: Some OSS libraries are happier if z.lib exists, even though it's not typical on Windows.
      copy %LIBRARY_LIB%\zlib.lib %LIBRARY_LIB%\z.lib || exit 1

      :: Qt in particular goes looking for this one (as of 4.8.7).
      copy %LIBRARY_LIB%\zlib.lib %LIBRARY_LIB%\zdll.lib || exit 1

      :: python>=3.10 depend on this being at %PREFIX%
      copy %LIBRARY_BIN%\zlib.dll %PREFIX%\zlib.dll || exit 1
)
if errorlevel 1 exit 1

:: Build zlibwapi.dll
if %ZLIB_COMPAT%==1 (
    mkdir ..\build-wapi || exit 1
    cd ..\build-wapi || exit 1

    cmake -G "NMake Makefiles" ^
          %CMAKE_ARGS% ^
          -DCMAKE_BUILD_TYPE:STRING="Release" ^
          -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
          -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
          -DWITH_GTEST=OFF ^
          -DZLIB_COMPAT=%ZLIB_COMPAT% ^
          -DZLIB_OUTPUT_NAME="zlibwapi" ^
          -DCMAKE_C_FLAGS="-DZLIB_WINAPI " ^
          .. || exit 1

    cmake --build . --config Release -j%CPU_COUNT% || exit 1
    copy "zlibwapi.dll" "%LIBRARY_BIN%\zlibwapi.dll" || exit 1
    copy "zlibwapi.lib" "%LIBRARY_LIB%\zlibwapi.lib" || exit 1
)
